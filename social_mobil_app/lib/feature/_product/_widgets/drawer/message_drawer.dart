import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';
import 'package:social_mobil_app/feature/view/message/view/message.dart';

class MessageDraver extends StatefulWidget {
  const MessageDraver({super.key});

  @override
  State<MessageDraver> createState() => _MessageDraverState();
}

class _MessageDraverState extends State<MessageDraver> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Drawer(
      backgroundColor: context.colors.onPrimary,
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Messages",
                style: context.textTheme.headlineMedium,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.filter_1_outlined))
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 30, top: 30, right: 30),
            padding: const EdgeInsets.only(bottom: 3),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(
                10.0,
              )),
              color: Colors.white,
            ),
            // color: Colors.red,
            width: 150,
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              //controller: _textEditingController,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 12, //This line!!!!!!!!!
                textBaseline: TextBaseline.alphabetic,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  // alignment: Alignment.topCenter,
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  iconSize: 30,
                ),
                border: InputBorder.none,
                hintText: "Arama Yapınız ",
                //configNotifier.translationObject["SearchOrder"],
                hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    textBaseline: TextBaseline.alphabetic),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListTile(
              title: const Text("Mesut"),
              subtitle: const Text("merhaba mesut"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/img/user.jpg")),
              trailing: Text(
                "3 saat önce",
                style: TextStyle(color: Colors.grey[500]),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ));
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListTile(
              title: const Text("Mesut"),
              subtitle: const Text("merhaba mesut"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/img/user.jpg")),
              trailing: Text(
                "3 saat önce",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListTile(
              title: const Text("Mesut"),
              subtitle: const Text("merhaba mesut"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/img/user.jpg")),
              trailing: Text(
                "3 saat önce",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListTile(
              title: const Text("Mesut"),
              subtitle: const Text("merhaba mesut"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/img/user.jpg")),
              trailing: Text(
                "3 saat önce",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
