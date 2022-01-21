import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_demo_1/data/network/authentication_apis.dart';
import 'package:up_demo_1/data/repositories/authentication_repo.dart';
import 'package:up_demo_1/logic/authentication/authentication_bloc.dart';
import 'package:up_demo_1/router/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            authenticationRepo: AuthenticationRepo(
              apis: AuthenticationApis(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Upwork Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: AppRoutes().onRouteGenerate,
      ),
    );
  }
}
