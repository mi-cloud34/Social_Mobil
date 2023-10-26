import 'package:flutter/material.dart';
import 'package:social_mobil_app/feature/_product/_widgets/grid/user_grid.dart';

class GetTimePage extends StatelessWidget {
  const GetTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: const <Widget>[
        UserGrid(),
        UserGrid(),
        UserGrid(),
        UserGrid(),
        UserGrid(),
      ],
    );
  }
}
