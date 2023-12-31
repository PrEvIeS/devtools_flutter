import 'package:flutter/material.dart';
import 'package:flutter_template/data/models/student/student.dart';
import 'package:flutter_template/usecases/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onLongPress: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          student.isActivist
                              ? const Text('Убрать из активистов?')
                              : const Text('Перевести в активисты?'),
                          ElevatedButton(
                            child: const Text('Да'),
                            onPressed: () {
                              GetIt.instance<HomeBloc>().add(
                                  HomeEvent.markStudent(studentId: student.id));
                              Navigator.pop(context);
                            },
                          ),
                          ElevatedButton(
                            child: const Text('Нет'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            leading: student.remoteImage != null
                ? Image.network(student.remoteImage!)
                : const Icon(Icons.account_circle, size: 55),
            title: Text(student.name),
            subtitle: Text(student.mark.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Является ли активистом?"),
                student.isActivist ? const Icon(Icons.done) : const Icon(Icons.close)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
