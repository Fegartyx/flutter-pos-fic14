import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/datasource/auth_remote_datasource.dart';
import '../../../core/data/models/auth_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDataSource _authRemoteDatasource = AuthRemoteDataSource();
  LoginBloc() : super(const LoginState.initial()) {
    on<_Login>((event, emit) async {
      emit(const LoginState.loading());
      try {
        final result = await _authRemoteDatasource.login(
          email: event.email,
          password: event.password,
        );
        emit(LoginState.success(result));
      } catch (e) {
        emit(LoginState.error(e.toString()));
      }
    });
  }
}
