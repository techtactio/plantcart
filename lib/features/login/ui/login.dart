import 'package:bloc_app/features/home/ui/home.dart';
import 'package:bloc_app/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Home()));
        }else if(state is UsernameAndPasswordMismatchState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text(
            "Username and Password doesn't match",
            style: TextStyle(color: Colors.black),
          ),
        ),
        duration: Duration(seconds: 5),
        margin: EdgeInsets.all(10),
        backgroundColor: Color.fromARGB(80, 51, 105, 30),
      ));
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/leaves.png'),
                Column(
                  children: [
                    Text(
                      "Welcome !",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.green.shade900,
                      ),
                    ),
                    const Text("Login in to your account"),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          hintText: 'Enter username',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(200, 51, 105, 30),
                          ),
                          fillColor: Color.fromARGB(80, 51, 105, 30),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Value is Empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter password',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(200, 51, 105, 30),
                          ),
                          fillColor: Color.fromARGB(80, 51, 105, 30),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Value is Empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 230.0),
                      child: SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              const Color.fromARGB(150, 51, 105, 30),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              loginBloc.add(LoginButtonClickedEvent(username: _usernameController.text, password: _passwordController.text));
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Don't have account?",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
