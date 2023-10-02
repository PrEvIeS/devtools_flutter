part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({@Default(0) int tabIndex}) = _Initial;
}
