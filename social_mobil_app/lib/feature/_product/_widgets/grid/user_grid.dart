import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/base/model/base_view_model.dart';
import 'package:social_mobil_app/core/constants/navigation/navigation_constants.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';
import 'package:social_mobil_app/feature/_product/_widgets/avatar/on_board_circle_avatar.dart';

class UserGrid extends StatefulWidget {
  const UserGrid({super.key});

  @override
  State<UserGrid> createState() => _UserGridState();
}

class _UserGridState extends State<UserGrid> with BaseViewModel {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigation.navigateToPageClear(
            path: NavigationConstants.USER_DETAY_VIEW);
      },
      child: Container(
          width: 150,
          padding: const EdgeInsets.all(8),
          //color: context.colors.primary,
          decoration: BoxDecoration(
              //color: Color(0xFFF1E6FF),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: context.colors.primary, width: 2)),
          child: Stack(
            children: [
              const Positioned(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: AssetImage("asset/img/user.jpg"),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Mehmet"),
                      Text("Ankara"),
                    ],
                  ),
                ]),
              ),
              Positioned(
                  top: 2,
                  left: 4,
                  child: Text(
                    "27",
                    style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.primary),
                  )),
              Positioned(
                  top: 0,
                  right: 0,
                  child: OnBoardCircle(
                    color: context.colors.onBackground,
                    radius: 8,
                  )),
            ],
          )),
    );
  }
}
