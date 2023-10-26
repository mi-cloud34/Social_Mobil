import 'package:flutter/material.dart';
import 'package:social_mobil_app/feature/view/login/view/background.dart';
import 'package:social_mobil_app/feature/view/register/view/signup_form.dart';
import 'package:social_mobil_app/feature/view/register/view/signup_top_image.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: MobileSignupScreen(),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SignUpScreenTopImage(),
        Row(
          children:  [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            const Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
