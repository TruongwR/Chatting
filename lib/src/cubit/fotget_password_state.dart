import 'package:freezed_annotation/freezed_annotation.dart';
part 'fotget_password_state.freezed.dart';

@freezed
class FotgetPasswordState with _$FotgetPasswordState {
  const factory FotgetPasswordState.initial() = _Initial;
  const factory FotgetPasswordState.loading() = _Loading;
  const factory FotgetPasswordState.succes() = _Succes;
  const factory FotgetPasswordState.failure(String error) = _Failure;
}
