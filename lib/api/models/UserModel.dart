class UserModel {
  String? studentId;
  String? firstName;
  String? lastName;
  String? tokenAP;
  String? token;
  DateTime? expire;
  String? hashedPassword;

  UserModel({
    this.studentId,
    this.firstName,
    this.lastName,
    this.tokenAP,
    this.token,
    this.expire,
  });

  // Converti in Map per jsonEncode
  Map<String, dynamic> toJson() => {
    'studentId': studentId,
    'firstName': firstName,
    'lastName': lastName,
    'tokenAP': tokenAP,
    'token': token,
    'expire': expire?.toIso8601String(), // DateTime -> stringa
  };

  // Crea oggetto da Map
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    studentId: json['studentId'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    tokenAP: json['tokenAP'],
    token: json['token'],
    expire: json['expire'] != null ? DateTime.parse(json['expire']) : null,
  );
}
