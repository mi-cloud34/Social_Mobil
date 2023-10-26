import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Aktivity",
              style: context.textTheme.headlineMedium,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        const Divider(height: 3, color: Colors.black),
        Card(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: ListTile(
              title: const Text("Mesut"),
              subtitle: Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: RichText(
                      text: TextSpan(
                        text: 'Liked ',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'my break heart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple)),
                          TextSpan(text: ' post!'),
                        ],
                      ),
                    )),
              ),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/img/user.jpg")),
              trailing: Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                  ),
                  child: Image.asset("asset/img/post.jpg")),
            ),
          ),
        ),
        const Divider(height: 3, color: Colors.black),
        Card(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListTile(
                leading: const CircleAvatar(
                    backgroundImage: AssetImage("asset/img/user.jpg")),
                title: const Text("Mesut"),
                subtitle: RichText(
                  text: TextSpan(
                    text: 'Comment ',
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'my day in the Autumun',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple)),
                      TextSpan(text: ' post!'),
                    ],
                  ),
                ),
                trailing: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: const BorderRadius.all(Radius.circular(20))),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Follow"))))),
        const Divider(height: 3, color: Colors.black),
        Card(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListTile(
                leading: const CircleAvatar(
                    backgroundImage: AssetImage("asset/img/user.jpg")),
                title: const Text("Melek"),
                subtitle: RichText(
                  text: TextSpan(
                    text: 'Send a you ',
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'follow request',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple)),
                    ],
                  ),
                ),
                trailing: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: const BorderRadius.all(Radius.circular(20))),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("approval"))))),
      ],
    );
  }
}
