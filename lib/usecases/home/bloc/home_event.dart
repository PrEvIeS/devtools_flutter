part of 'home_bloc.dart';


@Freezed()
class HomeEvent with _$HomeEvent {

  const factory HomeEvent.started() = _Started;

  const factory HomeEvent.tabChanged({@Default(0) int tabIndex}) = _TabChanged;
  const factory HomeEvent.markStudent({required int studentId}) = _MarkStudent;
  const factory HomeEvent.loadedStudentList({required List<Student> students}) = _LoadedStudentList;
}
