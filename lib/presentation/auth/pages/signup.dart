import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/common/helper/navigation/app_navigation.dart';
import 'package:mobile/data/models/auth/signup_req_params.dart';
import 'package:mobile/data/repositories/auth/auth.dart';
import 'package:mobile/data/source/auth/auth_api_service.dart';
import 'package:mobile/domain/auth/usecases/signup.dart';
import 'package:mobile/presentation/auth/pages/signin.dart';
import 'package:mobile/service_locator.dart';
import 'package:progress_state_button/progress_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ButtonState _buttonState = ButtonState.idle;
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _signupText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 30),
            _signupButton(),
            const SizedBox(height: 30),
            _signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signupButton() {
    return ProgressButton(
      state: _buttonState,
      onPressed: () async {
     await sl<SignUpUseCase>().call(
            params: SignupReqParams(email: _emailCon.text, password: _passwordCon.text)
        );

      },
      stateWidgets: {
        ButtonState.idle: const Text(
          "Sign Up",
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

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Do you have account ?"),
          TextSpan(
            text: "Sign In",
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.push(context, const SignInPage());
              },
          ),
        ],
      ),
    );
  }
}
