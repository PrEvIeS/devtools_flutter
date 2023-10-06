import 'package:flutter_template/data/models/student/student.dart';

abstract class StudentRepositoryInterface {
  Future<List<Student>> getStudentList();
  Future<List<Student>> getActivistList();

  void markStudent(int id);
}
