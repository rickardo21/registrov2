import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:registrov2/api/core/api_exception.dart';
import 'package:registrov2/api/models/LessonsModel.dart';
import 'package:registrov2/api/models/UserModel.dart';
import 'package:registrov2/utils/debugLogger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final String baseUrl;
  UserModel user = UserModel();

  final dio = Dio();

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

  Future<Map<String, dynamic>> _sendRequest(
    String method,
    String endpoint,
    Map<String, dynamic>? body,
  ) async {
    final String url;

    if (endpoint.contains("auth")) {
      url = '$baseUrl$endpoint';
    } else {
      String userID = user.studentId!.substring(1);
      url = '$baseUrl/students/$userID/$endpoint';
    }

    final headers = _headers();

    try {
      late Response response;
      final upperMethod = method.toUpperCase();

      if (upperMethod == "GET") {
        response = await dio.get(url, options: Options(headers: headers));
      } else if (upperMethod == "POST") {
        response = await dio.post(
          url,
          data: body,
          options: Options(headers: headers),
        );
      } else {
        throw Exception("Unsupported HTTP method: $method");
      }

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final message = e.response?.data ?? e.message;
      throw ApiException(statusCode: statusCode, message: message.toString());
    }
  }

  Future<void> login(String username, String password) async {
    try {
      final data = await _sendRequest("post", "auth/login", {
        "ident": username,
        "pass": password,
        "app_code": "CVVS",
      });

      user.studentId = data['ident'].toString();
      user.token = data['token'];
      user.firstName = data['firstName'];
      user.lastName = data['lastName'];
      user.tokenAP = data['tokenAP'];
      // user.expire = DateTime.parse(data["expire"]);

      await saveSession();
    } catch (e) {
      DebugLogger().log("Login failed: $e");
      throw ApiException(statusCode: 0, message: "Login failed: $e");
    }
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

  Future<List<LessonModel>> fetchLessons(String date) async {
    try {
      final data = await _sendRequest("get", "/lessons/$date", null);
      if (data['lessons'] is List) {
        return (data['lessons'] as List)
            .map((lesson) => LessonModel.fromJson(lesson))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      DebugLogger().log("Fetch lessons failed: $e");
      throw ApiException(statusCode: 0, message: "Fetch lessons failed: $e");
    }
  }
}
