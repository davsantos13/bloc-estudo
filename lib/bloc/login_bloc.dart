import 'package:bloc_study/bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_study/user.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignInEvent) {
      try {
        yield StartLoginState();

        final user = await authenticate(event.email, event.password);
        if (user == null) {
          yield ErrorLoginState(msg: 'Email ou senha inválidos');
        } else {
          yield SuccessLoginState(user: user);
        }
      } catch (e) {
        print(e);
        yield ErrorLoginState(msg: 'Unknown Error');
      }
    }
  }

  Future<User> authenticate(String email, String password) {
    return Future.delayed(Duration(seconds: 3), () {
      if (email == 'david@gmail.com' && password == '123') {
        return User(email: email, name: 'David');
      }

      return null;
    });
  }
}
