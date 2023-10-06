import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';

part 'student.g.dart';

@Freezed(fromJson: true, copyWith: true)
class Student with _$Student {
  factory Student({
    required int id,
    String? remoteImage,
    required String name,
    required double mark,
    @Default(false) bool isActivist,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'] ?? 0,
        name: json['firstName'] ?? '',
        remoteImage: json['image'] ?? '',
        mark: double.parse((Random().nextDouble() * 5.0).toStringAsFixed(2)),
        isActivist: Random().nextBool(),
      );
}
