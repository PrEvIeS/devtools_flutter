part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({@Default(0) int tabIndex, required List<Student> students,required List<Student> activists}) = _Initial;

  const factory HomeState.loading({@Default(0) int tabIndex, @Default([]) List<Student> students,@Default([]) List<Student> activists}) = _Loading;
}
