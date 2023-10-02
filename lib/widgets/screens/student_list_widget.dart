import 'package:flutter/material.dart';
import 'package:flutter_template/data/models/student/student.dart';
import 'package:flutter_template/widgets/student_card.dart';

class StudentList extends StatelessWidget {
  StudentList({Key? key, required this.students}) : super(key: key);
  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (BuildContext context, itemIndex) {
        return StudentCard(student: students[itemIndex]);
      },
    );
  }
}
