import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';

/* class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profil Page"));
  }
} */

/* import 'package:settingapp_flutter/Widget/Info.dart';
import 'package:settingapp_flutter/Widget/MyInfo.dart';
import 'package:settingapp_flutter/Widget/OpaqueImage.dart';
 */

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    //backgroundImage: NetworkImage('https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp'),
                    backgroundImage: AssetImage("asset/img/user.jpg"),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Melek B',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'My Life my rules',
                          style: TextStyle(
                              color: Colors.blueGrey[400],
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Center(
                              child: IconButton(
                                  onPressed: () => {},
                                  icon: Icon(
                                    Icons.message,
                                    color: Colors.blueGrey[400],
                                  ))),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          padding: const EdgeInsets.only(left: 20),
                          child: ElevatedButton(
                            /*   shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.blue,
                                width: 1,
                                style: BorderStyle.solid
                            ), borderRadius: BorderRadius.circular(50)),
                            disabledColor: Colors.blue,
                            color: Colors.blue, */
                            onPressed: () {},
                            child: const Text(
                              'Follow',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.blueGrey[200],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '203',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                        Text(
                          'Followers',
                          style:
                              TextStyle(fontSize: 15, color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '932',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                        Text(
                          'Following',
                          style:
                              TextStyle(fontSize: 15, color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '30',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                        Text(
                          'Posts',
                          style:
                              TextStyle(fontSize: 15, color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.blueGrey[200],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Top Tickets',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Wrap(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //alignment: WrapAlignment.spaceBetween,
                      runSpacing: 20,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                              child: Text(
                            'Duygusal',
                            style: TextStyle(color: Colors.blueGrey),
                          )),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                              child: Text(
                            'Hayvansever',
                            style: TextStyle(color: Colors.blueGrey),
                          )),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                              child: Text(
                            'Kitap kurdu',
                            style: TextStyle(color: Colors.blueGrey),
                          )),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                              child: Text(
                            'Kızgın',
                            style: TextStyle(color: Colors.blueGrey),
                          )),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                              child: Text(
                            'İyimser',
                            style: TextStyle(color: Colors.blueGrey),
                          )),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                              child: Text(
                            'Mutlu',
                            style: TextStyle(color: Colors.blueGrey),
                          )),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: Center(
                              child: Text(
                            'Mutsuz',
                            style: TextStyle(color: context.colors.onPrimary),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    child: const Wrap(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 10,
                      children: [],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Projects',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'asset/img/post.jpg',
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: const Text(
                                'New Post',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'asset/img/post.jpg',
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 10, left: 10),
                                child: const Text(
                                  'two post',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
