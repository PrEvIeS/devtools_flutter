import 'package:dio/dio.dart';
import 'package:flutter_template/data/models/student/student.dart';
import 'package:flutter_template/data/repositories/student/student_repository_interface.dart';

class StudentRepository implements StudentRepositoryInterface {
  StudentRepository({required Dio dio, this.useNetwork = false})
      : _studentDio = dio;

  late final Dio _studentDio;
  late final bool useNetwork;
  final List<Student> localStudents = [
    Student(name: 'Test', mark: 1.5, id: 0),
    Student(name: 'Test', mark: 2.5, isActivist: true, id: 1),
    Student(name: 'Test', mark: 3.5, id: 2),
    Student(name: 'Test', mark: 4.5, isActivist: true, id: 3),
  ];

  @override
  Future<List<Student>> getStudentList() async {
    List<Student> students = [];
    if (useNetwork) {
      Response remoteStudent =
          await _studentDio.get('users', queryParameters: {'limit': 50});
      List<dynamic> response = remoteStudent.data['users'];
      List<Student> list = response.map((dynamic e) {
        return Student.fromJson(e);
      }).toList();
      students = list;
    } else {
      students = localStudents;
    }
    return List<Student>.from(students);
  }

  @override
  void markStudent(int studentId) {
    final Student student =
        localStudents.firstWhere((element) => element.id == studentId);
    localStudents[studentId] = student.copyWith(
      isActivist: !student.isActivist,
    );
  }

  @override
  Future<List<Student>> getActivistList() async {
    List<Student> activists = [];
    if (useNetwork) {
      Response remoteStudent =
          await _studentDio.get('users', queryParameters: {'limit': 50});
      List<dynamic> response = remoteStudent.data['users'];
      List<Student> list = response.map((dynamic e) {
        return Student.fromJson(e);
      }).toList();
      activists = list.where((element) => element.isActivist).toList();
    } else {
      activists = localStudents.where((element) => element.isActivist).toList();
    }
    return List<Student>.from(activists);
  }
}
