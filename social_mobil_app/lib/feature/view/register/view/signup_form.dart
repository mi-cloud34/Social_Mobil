import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/base/model/base_view_model.dart';
import 'package:social_mobil_app/core/constants/navigation/navigation_constants.dart';
import 'package:social_mobil_app/feature/view/home/view/home_page.dart';
import 'package:social_mobil_app/feature/view/login/view/already_have_account.dart';
import 'package:social_mobil_app/feature/view/register/view/or_divider.dart';
import 'package:social_mobil_app/feature/view/register/view/social_icon.dart';

// ignore: must_be_immutable
class SignUpForm extends StatelessWidget with BaseViewModel {
  SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: const Color(0xFF6F35A5),
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "your name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: const Color(0xFF6F35A5),
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.email),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomesPage(),
                  ));
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: 8),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              navigation.navigateToPageClear(
                  path: NavigationConstants.LOGIN_VIEW);
            },
          ),
          const OrDivider(),
          const SocalIcon(
            iconSrc: "asset/icons/google-plus.svg",
          )
        ],
      ),
    );
  }
}
