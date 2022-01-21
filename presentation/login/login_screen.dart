import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_demo_1/logic/authentication/authentication_bloc.dart';
import 'package:up_demo_1/presentation/dashboard/dashboard_screen.dart';
import 'package:up_demo_1/router/app_routes.dart';
import 'package:up_demo_1/widgets/common_loading.dart';
import 'package:up_demo_1/widgets/common_toast.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController, _passwordController;
  late AuthenticationBloc _authenticationBloc;
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationStateLoading) {
          showLoading(context);
        }
        if (state is AuthenticationStateFailed) {
          hideLoading(context);
          showNotification(context, message: "Something went wrong");
        }
        if (state is AuthenticationStateSuccess) {
          hideLoading(context);
          _loginSuccess();
        }
        if (state is AuthenticationStateUnAuthorized) {
          hideLoading(context);
          showNotification(context, message: "Unauthorized access");
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    controller: _emailController,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    _loginClicked();
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///This method is to initialize any variable or controller in the class.
  void init() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    if (kDebugMode) {
      _emailController.text = 'mobiletest@ihost.am';
      _passwordController.text = "MobileTest@001";
    }
  }

  ///This method is used to destroy/dispose controllers streams
  void destroy() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  ///This method is associated with [Login] button and invoked when button clicked
  void _loginClicked() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      _authenticationBloc.add(
        AuthenticationEventFetchLogin(
            email: _emailController.text, password: _passwordController.text),
      );
    } else {
      showNotification(context, message: 'Email and Password must not empty');
    }
  }

  void _loginSuccess() {
    AppRoutes.nextPageNamed(context, DashboardScreen.route);
  }
}
