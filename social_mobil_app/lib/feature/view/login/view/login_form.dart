import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/base/model/base_view_model.dart';
import 'package:social_mobil_app/core/constants/navigation/navigation_constants.dart';

import 'package:social_mobil_app/feature/view/login/view/already_have_account.dart';
import 'package:social_mobil_app/feature/view/register/register_page.dart';
// ignore: must_be_immutable
class LoginForm extends StatelessWidget with BaseViewModel {
   LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor:  const Color(0xFF6F35A5),
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor:  const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                 navigation.navigateToPageClear(
                  path: NavigationConstants.HOME_VIEW);
         
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}