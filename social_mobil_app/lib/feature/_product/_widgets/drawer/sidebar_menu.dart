import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';

import 'package:social_mobil_app/feature/_product/_model/sidebars/sidebar_item_model.dart';
import 'package:social_mobil_app/feature/_product/components/sidebar_menu_item_row.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<MenuItemModel> _browseMenuIcons = MenuItemModel.menuItems;
  String _selectedMenu = MenuItemModel.menuItems[0].title;

  /* void onThemeRiveIconInit(artboard) {
    final controller = StateMachineController.fromArtboard(
        artboard, _themeMenuIcon[0].riveIcon.stateMachine);
    artboard.addController(controller!);
    _themeMenuIcon[0].riveIcon.status =
        controller.findInput<bool>("active") as SMIBool;
  } */

  void onMenuPress(MenuItemModel menu) {
    setState(() {
      _selectedMenu = menu.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 40),
      // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,  bottom: MediaQuery.of(context).padding.bottom - 60),
      constraints: const BoxConstraints(maxWidth: 230),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 200,
              height: 180,
              decoration: BoxDecoration(
                  color: context.colors.primary,
                  //boxShadow: List.filled(20, BoxShadow(color: Colors.white)),
                  // border: Border.all(color: Colors.white),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    //backgroundImage: Image.asset("asset/img/user.jpg"),
                    backgroundImage: AssetImage("asset/img/user.jpg"),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mesut",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Inter"),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Software Engineer",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 15,
                            fontFamily: "Inter"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuButtonSection(
                      // title: "BROWSE",
                      selectedMenu: _selectedMenu,
                      menuIcons: _browseMenuIcons,
                      onMenuPress: onMenuPress),
                ],
              ),
            ),
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}

class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection(
      {Key? key,
      required this.menuIcons,
      this.selectedMenu = "Home",
      this.onMenuPress})
      : super(key: key);

  final String selectedMenu;
  final List<MenuItemModel> menuIcons;
  final Function(MenuItemModel menu)? onMenuPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*  Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 8),
          child: Text(
            // title,
            "title",
            style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 15,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600),
          ),
        ), */
        Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              for (var menu in menuIcons) ...[
                Divider(
                    color: Colors.white.withOpacity(0.1),
                    thickness: 3,
                    height: 3,
                    indent: 16,
                    endIndent: 16),
                MenuRow(
                  menu: menu,
                  selectedMenu: selectedMenu,
                  onMenuPress: () => onMenuPress!(menu),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
