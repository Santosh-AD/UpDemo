import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:up_demo_1/data/network/base/base_network_status.dart';
import 'package:up_demo_1/data/repositories/authentication_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  late AuthenticationRepo authenticationRepo;
  AuthenticationBloc({required this.authenticationRepo}) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticationEventFetchLogin) {
      yield AuthenticationStateLoading();
      ApiResult res =
          await authenticationRepo.fetchLogin(email: event.email, password: event.password);
      if (res.status == ApiStatus.success) {
        yield AuthenticationStateSuccess();
      } else if (res.status == ApiStatus.badRequest) {
        yield AuthenticationStateFailed();
      } else if (res.status == ApiStatus.failed) {
        yield AuthenticationStateFailed();
      } else if (res.status == ApiStatus.unauthorized) {
        yield AuthenticationStateUnAuthorized();
      } else {
        yield AuthenticationStateFailed();
      }
    }
  }
}
