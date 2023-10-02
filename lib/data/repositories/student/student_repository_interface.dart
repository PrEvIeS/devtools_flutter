import 'package:flutter_template/data/models/student/student.dart';

abstract class StudentRepositoryInterface {
  Future<List<Student>> getNetworkStudentList();

  List<Student> getLocalStudentList();

  void markStudent(int id);
}
