import 'package:bloc_study/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              builder: (context) => LoginBloc(),
            )
          ],
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is StartLoginState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ErrorLoginState) {
                return Login(errorMessage: state.msg);
              }

              if (state is SuccessLoginState) {
                return Home(title: 'Obaaaaaaa', user: state.user,);
              }
              return Login();
            },
          )),
    );
  }
}

class Login extends StatefulWidget {
  final String errorMessage;

  Login({this.errorMessage});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController =
      TextEditingController(text: 'david@gmail.com');

  TextEditingController _senhaController = TextEditingController(text: '123');

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    void authenticate(){
      final signInEvent = SignInEvent(email: _emailController.text, password: _senhaController.text);
      bloc.dispatch(signInEvent);
    }


    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _senhaController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              SizedBox(
                height: 20,
              ),
              widget.errorMessage == null ? Container() : Text(widget.errorMessage),
              InkWell(
                onTap: authenticate,
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Center(
                    child: Text('Login'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
