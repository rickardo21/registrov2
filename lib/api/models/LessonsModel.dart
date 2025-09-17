class LessonModel {
  final int evtId;
  final String evtDate;
  final String evtCode;
  final int evtHPos;
  final int evtDuration;
  final String classDesc;
  final String authorName;
  final int subjectId;
  final String? subjectCode;
  final String subjectDesc;
  final String lessonType;
  final String lessonArg;

  LessonModel({
    required this.evtId,
    required this.evtDate,
    required this.evtCode,
    required this.evtHPos,
    required this.evtDuration,
    required this.classDesc,
    required this.authorName,
    required this.subjectId,
    this.subjectCode,
    required this.subjectDesc,
    required this.lessonType,
    required this.lessonArg,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      evtId: json['evtId'],
      evtDate: json['evtDate'],
      evtCode: json['evtCode'],
      evtHPos: json['evtHPos'],
      evtDuration: json['evtDuration'],
      classDesc: json['classDesc'],
      authorName: json['authorName'],
      subjectId: json['subjectId'],
      subjectCode: json['subjectCode'], // nullable
      subjectDesc: json['subjectDesc'],
      lessonType: json['lessonType'],
      lessonArg: json['lessonArg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'evtId': evtId,
      'evtDate': evtDate,
      'evtCode': evtCode,
      'evtHPos': evtHPos,
      'evtDuration': evtDuration,
      'classDesc': classDesc,
      'authorName': authorName,
      'subjectId': subjectId,
      'subjectCode': subjectCode,
      'subjectDesc': subjectDesc,
      'lessonType': lessonType,
      'lessonArg': lessonArg,
    };
  }
}
