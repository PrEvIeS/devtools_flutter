import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/repositories/student/student_repository_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  StudentRepositoryInterface studentRepository;
  bool useNetwork;

  HomeBloc({required this.studentRepository, required this.useNetwork})
      : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<_TabChanged>(_onTabChanged);
    on<_MarkStudent>(_onMarkStudent);
  }

  void _onTabChanged(_TabChanged event, Emitter<HomeState> emitter) {
    emit(
      state.copyWith(tabIndex: event.tabIndex),
    );
  }

  void _onMarkStudent(_MarkStudent event, Emitter<HomeState> emitter) {
    studentRepository.markStudent(event.studentId);
    emit(
      state.copyWith(),
    );
  }
}
