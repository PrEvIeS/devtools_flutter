import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';

part 'student.g.dart';

@Freezed(fromJson: true)
class Student with _$Student {
  factory Student({
    required int id,
    String? remoteImage,
    required String name,
    required double mark,
    @Default(false) bool isActivist,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
