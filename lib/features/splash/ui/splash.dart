import 'package:bloc_app/features/home/ui/home.dart';
import 'package:bloc_app/features/login/ui/login.dart';
import 'package:bloc_app/features/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final SplashBloc splashBloc = SplashBloc();

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    splashBloc.add(SplashInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: splashBloc,
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          await Future.delayed(const Duration(seconds: 3));
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) {
                return const Home();
              },
            ),
          );
        } else if (state is LoginFailedState) {
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: ((ctx) => Login())));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.green.shade200,
        body: const Center(
          child: Icon(Icons.eco_outlined, size: 40.0, weight: 30.0),
        ),
      ),
    );
  }


}

