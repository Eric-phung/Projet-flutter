import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_page.dart';

const dGreen = Color(0xE18E8E8E);
const dWhite = Color(0xFFe8f4f2);
const dBlack = Color(0xE1383838);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhitebeardApp Redesign',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: dBlack,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: dWhite,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: dWhite,
                size: 30,
              ),
            ),
          ]),
      body: Column(
        children: [
          MenuSection(),
          FavoriteSection(),
          Expanded(
            child: MessageSection(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: dGreen,
        child: const Icon(
          Icons.edit,
          size: 20,
        ),
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  final List menuItems = ["         WHITEBEARD APP            "];

  MenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dBlack,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
          child: Row(
            children: menuItems.map((item) {
              return Container(
                margin: const EdgeInsets.only(right: 55),
                child: Text(
                  item,
                  style: GoogleFonts.inter(
                    color: Colors.white60,
                    fontSize: 29,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class FavoriteSection extends StatelessWidget {
  FavoriteSection({Key? key}) : super(key: key);

  final List favoriteContacts = [
    {
      'name': "ERIC",
      'profile': 'images/avatar/Eric.jpg',
    },
    {
      'name': "MELVIN",
      'profile': 'images/avatar/MELVIN.jpg',
    },
    {
      'name': "THÉODORE",
      'profile': 'images/avatar/Theo.jpg',
    },
    {
      'name': "MARC",
      'profile': 'images/avatar/Marc.jpg',
    },
    {
      'name': "SALIM",
      'profile': 'images/avatar/salim.jpg',
    },
    {
      'name': "FABIL",
      'profile': 'images/avatar/Fabil.jpg',
    },
    {
      'name': "FABILLA",
      'profile': 'images/avatar/Fabilla.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dBlack,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: dGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "Mes contacts favoris",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: favoriteContacts.map((favorite) {
                  return Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: dWhite,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(favorite['profile']),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          favorite['name'],
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageSection extends StatelessWidget {
  MessageSection({Key? key}) : super(key: key);

  final List messages = [
    {
      'senderProfile': 'images/avatar/Fabil.jpg',
      'senderName': 'FABIL',
      'message': 'Drague pas ma soeur !!',
      'unRead': 0,
      'date': '16:35',
    },
    {
      'senderProfile': 'images/avatar/Fabilla.jpg',
      'senderName': 'FABILLA',
      'message': 'On se voit demain ^^',
      'unRead': 0,
      'date': '16:35',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: messages.map((message) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatPage(),
                ),
              );
            },
            splashColor: dGreen,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 10, top: 15),
              child: Row(children: [
                Container(
                  width: 62,
                  height: 62,
                  margin: EdgeInsets.only(right: 23),
                  decoration: BoxDecoration(
                      color: dGreen,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          message['senderProfile'],
                        ),
                      )),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message['senderName'],
                                style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    message['message'],
                                    style: GoogleFonts.inter(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(message['date']),
                              message['unRead'] != 0
                                  ? Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: dGreen,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        message['unRead'].toString(),
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ))
                                  : Container()
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.grey[400],
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        }).toList(),
      ),
    );
  }
}
