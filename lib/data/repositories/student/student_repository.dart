import 'package:dio/dio.dart';
import 'package:flutter_template/data/models/student/student.dart';
import 'package:flutter_template/data/repositories/student/student_repository_interface.dart';

class StudentRepository implements StudentRepositoryInterface {
  StudentRepository({required Dio dio}) : _studentDio = dio;

  late final Dio _studentDio;
  final List<Student> localStudents = [
    Student(name: 'Test', mark: 1.5, id: 0),
    Student(name: 'Test', mark: 2.5, isActivist: true, id: 1),
    Student(name: 'Test', mark: 3.5, id: 2),
    Student(name: 'Test', mark: 4.5, isActivist: true, id: 3),
  ];

  @override
  Future<List<Student>> getNetworkStudentList() async {
    List<Student> students = [];
    Response<dynamic> studentsData = await _studentDio.get('users');

    return students;
  }

  @override
  List<Student> getLocalStudentList() {
    print(localStudents);

    return localStudents;
  }

  @override
  void markStudent(int studentId) {
    localStudents[studentId] = Student(
      name: localStudents[studentId].name,
      mark: localStudents[studentId].mark,
      isActivist: true,
      id: studentId,
    );
  }
}
