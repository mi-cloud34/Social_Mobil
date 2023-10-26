import 'package:flutter/material.dart';
import 'package:social_mobil_app/feature/view/login/view/background.dart';
import 'package:social_mobil_app/feature/view/welcome/view/login_btn.dart';
import 'package:social_mobil_app/feature/view/welcome/view/welcome_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WelcomeImage(),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: LoginAndSignupBtn(),
                ),
                Spacer(),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
