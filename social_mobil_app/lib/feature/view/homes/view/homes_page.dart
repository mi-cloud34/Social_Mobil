import 'package:flutter/material.dart';
import 'package:social_mobil_app/feature/_product/_widgets/card/post_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: const [
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
      ],
    );
  }
}
