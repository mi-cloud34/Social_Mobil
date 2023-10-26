import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: <Widget>[
            _gonderiBasligi(),
            _gonderiResmi(),
            _gonderiAlt(),
          ],
        ));
  }

  gonderiSecenekleri() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Seçiminiz nedir?"),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text("Gönderiyi Sil"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: const Text(
                  "Vazgeç",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  Widget _gonderiBasligi() {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage("asset/img/user.jpg"),
          ),
        ),
      ),
      title: GestureDetector(
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Profil(profilSahibiId: widget.gonderi.yayinlayanId,)));
          },
          child: const Text(
            "Mesut",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          )),
      trailing: IconButton(
          icon: const Icon(Icons.more_vert), onPressed: () => gonderiSecenekleri()),
      contentPadding: const EdgeInsets.all(0.0),
    );
  }

  Widget _gonderiResmi() {
    return GestureDetector(
      onDoubleTap: () {},
      child: Image.asset(
        "asset/img/post.jpg",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _gonderiAlt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                  text: const TextSpan(
                      text: "Mesut",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                    TextSpan(
                        text: "new post",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ))
                  ])),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 35.0,
                    ),
                    //: Icon(Icons.favorite, size: 35.0, color: Colors.red,),
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(
                      Icons.comment,
                      size: 35.0,
                    ),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Yorumlar(gonderi: widget.gonderi,)));
                    }),
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("15 beğeni",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        const SizedBox(
          height: 2.0,
        ),
      ],
    );
  }
}
