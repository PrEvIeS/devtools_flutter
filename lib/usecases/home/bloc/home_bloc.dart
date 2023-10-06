import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/models/student/student.dart';
import 'package:flutter_template/data/repositories/student/student_repository_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  StudentRepositoryInterface studentRepository;
  bool useNetwork;

  HomeBloc({required this.studentRepository, required this.useNetwork})
      : super(const HomeState.initial(students: [],activists: [])) {
    on<_TabChanged>(_onTabChanged);
    on<_Started>(_onStarted);
    on<_MarkStudent>(_onMarkStudent);
  }

  void _onTabChanged(_TabChanged event, Emitter<HomeState> emitter) {
    emitter(
      state.copyWith(tabIndex: event.tabIndex),
    );
  }

  void _onMarkStudent(_MarkStudent event, Emitter<HomeState> emitter) async {
    emitter(const HomeState.loading());
    studentRepository.markStudent(event.studentId);
    emitter(state.copyWith(students: await studentRepository.getStudentList(),activists: await studentRepository.getActivistList()));
  }

  void _onStarted(_Started event, Emitter<HomeState> emitter) async {
    emitter(const HomeState.loading());
    emitter(state.copyWith(students: await studentRepository.getStudentList(),activists: await studentRepository.getActivistList()));
  }
}
