import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_mobil_app/core/base/model/base_view_model.dart';
import 'package:social_mobil_app/core/constants/navigation/navigation_constants.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';

// ignore: must_be_immutable
class DrawerPage extends ConsumerWidget with BaseViewModel {
  DrawerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: context.colors.onPrimary,
      width: 220,
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.purple,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                const CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: AssetImage("asset/img/person.png"),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text("mesut",
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: Colors.black)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("mesut@gmail.com",
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: Colors.black)),
                ),
              ],
            ),
            /* child: UserAccountsDrawerHeader(
              //margin: EdgeInsets.only(left: 50),
              accountName: Text("mesut",
                  style: context.textTheme.titleLarge
                      ?.copyWith(color: Colors.black)),
              accountEmail: Text("mesut@gmail.com",
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("asset/img/person.png"),
              ),
              /*   decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/img/person.png"),
                    fit: BoxFit.fill,
                  ),
                ), */
            ), */
          ),
          Divider(
            height: 3,
            color: context.colors.onPrimary,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {},
          ),
          Divider(
            height: 3,
            color: context.colors.onPrimary,
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text("Mesajlarım"),
            onTap: () {},
          ),
          Divider(
            height: 3,
            color: context.colors.onPrimary,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Ayarlar"),
            onTap: () {},
          ),
          Divider(
            height: 3,
            color: context.colors.onPrimary,
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text("Profil"),
            onTap: () {},
          ),
          Divider(
            height: 3,
            color: context.colors.onPrimary,
          ),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const Text("Çıkış"),
            onTap: () {
              navigation.navigateToPageClear(path: NavigationConstants.LOG_OUT);
            },
          )
        ],
      ),
    );
  }
}
