import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/models.dart';
import 'package:whatsapp_clone/screens/tabBarScreens/chats_screen/userchat_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  // TOP CONTAINER VOID FUNCTION
  bool isSelectedTumu = true;
  bool isSelectedOkunmamis = false;
  bool showOnlyNewMessages=false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // *** TOP MINI CONTAİNERS ***
          topMiniContainers(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          // *** CONTACTS LİST ***
          for (var Person in persons)
            contacts(Person, context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.11)
        ],
      ),
    );
  }

  // *** TOP MINI CONTAİNERS ***
  Row topMiniContainers(BuildContext context) {
    return Row(
          children: [
            // *** TOP CONTAİNERS "TÜMÜ" ***
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelectedTumu = true; // 1st selected
                  isSelectedOkunmamis = false; // 2nd not selected
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                height: MediaQuery.of(context).size.height * 0.03,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.04),
                  color: isSelectedTumu == true
                      ? Theme.of(context).dialogBackgroundColor
                      : const Color.fromARGB(115, 131, 131, 131),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Center(
                    child: Text(
                      "Tümü",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          color: isSelectedTumu == true
                              ? const Color.fromARGB(255, 30, 161, 109)
                              : const Color.fromARGB(255, 128, 128, 128)),
                    ),
                  ),
                ),
              ),
            ),
            // *** TOP CONTAİNERS "OKUNMAMIŞ" ***
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelectedTumu = false; // 1st selected
                  isSelectedOkunmamis = true; // 2nd not selected
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.03,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.04),
                  color: isSelectedOkunmamis == true
                      ? Theme.of(context).dialogBackgroundColor
                      : const Color.fromARGB(115, 131, 131, 131),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Center(
                    child: Text(
                      "Okunmamış",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          color: isSelectedOkunmamis == true
                              ? const Color.fromARGB(255, 30, 161, 109)
                              : const Color.fromARGB(255, 128, 128, 128)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
  }

  // *** CONTACTS LİST ***
  InkWell contacts(Person Person, BuildContext context) {
    return InkWell(
            onTap: () {
              // *** SEÇİLEN KİŞİ MESAJ SAYFASINA  MAP İLE VERİ GÖNDERİYORUZ ***
              Map<String, dynamic> personData = {
                "messageState": Person.messagestate,
                'image': Person.image,
                'name': Person.name,
                'message': Person.message,
              };
              // *** MESAJ SAYFASI GEÇİŞ EFEKT ***
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 400),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(1.0, 0.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) {
                    // İkinci sayfaya veriyi geçiriyoruz
                    return const UserChatScreen();
                  },
                  settings: RouteSettings(
                    arguments: personData,
                  ),
                ),
              );
            },
            child: Visibility(
              visible: isSelectedTumu==true?true:persons.indexOf(Person) < 3,
              child: ListTile(
                leading: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.03,
                    backgroundImage: NetworkImage(Person.image)),
                title: Text(Person.name,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w500)),
                subtitle: Text(Person.message,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(Person.clock,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.028)),
                    Visibility(
                      visible: persons.indexOf(Person) < 3,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.06,
                        height: MediaQuery.of(context).size.height * 0.03,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(255, 54, 155, 110)),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
