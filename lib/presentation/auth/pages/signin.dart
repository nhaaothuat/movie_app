import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/common/helper/navigation/app_navigation.dart';
import 'package:mobile/presentation/auth/pages/signup.dart';
import 'package:progress_state_button/progress_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ButtonState _buttonState = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _signinText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 30),
            _signinButton(),
            const SizedBox(height: 30),
            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signinButton() {
    return ProgressButton(
      state: _buttonState,
      onPressed: () async {

      },
      stateWidgets: {
        ButtonState.idle: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        ButtonState.loading: const SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        ButtonState.success: const Icon(Icons.check, color: Colors.white),
        ButtonState.fail: const Icon(Icons.close, color: Colors.white),
      },
      stateColors: {
        ButtonState.idle: Colors.blue,
        ButtonState.loading: Colors.blue,
        ButtonState.success: Colors.green,
        ButtonState.fail: Colors.red,
      },
    );
  }

  Widget _signupText(BuildContext context){
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Don't you have account ?"
          ),
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: Colors.blue
            ),
            recognizer: TapGestureRecognizer()..onTap=(){
              AppNavigation.push(context, SignUpPage());
            }
          )
        ]
      )
    );
  }
}