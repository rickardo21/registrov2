import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:registrov2/api/core/api_exception.dart';
import 'package:registrov2/api/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final String baseUrl;
  UserModel user = UserModel();

  // ApiClient({this.baseUrl = "https://web.spaggiari.eu/rest/v1"});
  ApiClient({this.baseUrl = "https://web24.spaggiari.eu/rest/v1"});

  void setToken(String token) => user.token = token;

  Future<void> saveSession() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString('user', userJson);
  }

  Future<UserModel?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson == null) return null;
    final Map<String, dynamic> userMap = jsonDecode(userJson);
    return UserModel.fromJson(userMap);
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: _headers(),
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      return await _sendRequest("POST", endpoint, body);
    } on ApiException catch (e) {
      if (e.statusCode == 401 && await _tryAutoLogin()) {
        return await _sendRequest("POST", endpoint, body);
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _sendRequest(
    String method,
    String endpoint,
    Map<String, dynamic>? body,
  ) async {
    final url = Uri.parse('$baseUrl$endpoint');

    http.Response response;
    final headers = _headers();

    if (method == "GET") {
      response = await http.get(url, headers: headers);
    } else {
      response = await http.post(url, headers: headers, body: jsonEncode(body));
    }

    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        throw ApiException(
          statusCode: response.statusCode,
          message: "Empty response body",
        );
      }
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }

  Future<bool> _tryAutoLogin() async {
    // if (user.studentId != null && user.hashedPassword != null) {
    //   try {
    //     final data = await post("/auth/login", {
    //       "ident": user.studentId!,
    //       "pass": user.hashedPassword!,
    //       "app_code": "CVVS",
    //     });
    //     user.token = data["token"];
    //     user.studentId = data["ident"];
    //     await saveSession();
    //     return true;
    //   } catch (_) {
    //     return false;
    //   }
    // }
    return false;
  }

  Future<void> login(String username, String password) async {
    final response = await post("/auth/login", {
      "ident": username,
      "pass": password,
      "app_code": "CVVS",
    });

    user.studentId = response["ident"].toString().substring(1);
    user.token = response["token"];
    user.firstName = response["firstName"];
    user.lastName = response["lastName"];
    user.tokenAP = response["tokenAP"];
    user.expire = DateTime.parse(response["expire"]);

    await saveSession();
  }

  Map<String, String> _headers() {
    final headers = {
      "Content-Type": "application/json",
      //   "User-Agent": "CVVS/std/4.2.3 Android/12",
      "User-Agent": "CVVS/std/4.2.3 iOS/17",
      "Z-Dev-ApiKey":
          "Tg1NWEwNGIgIC0K", // API Key for authentication -- they should change every now and then so they might need changing
    };

    if (user.token != null) {
      headers["Z-Auth-token"] = user.token!;
    }

    return headers;
  }
}
