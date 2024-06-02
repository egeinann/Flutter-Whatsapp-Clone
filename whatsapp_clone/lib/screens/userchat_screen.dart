import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatsapp_clone/customs/themes.dart';
import 'package:whatsapp_clone/models/model.dart';

class UserChatScreen extends StatefulWidget {
  const UserChatScreen({super.key});

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  // *** SELECTED MESSAGE - MESAJ SEÇME BOOLEAN ***
  bool selectedMessage = false;
  bool selectedModelMessage = false;
  int selectedMessageCount = 0;
  // *** TIMECONTAINER ABOVE MESSAGES IF(!added)***
  bool isTimeContainerAdded = false;
  // *** TEXTFIELD - CONTROLLER ***
  bool textFieldState = false;
  final TextEditingController _controller = TextEditingController();
  // *** ADD NEW MESSAGE LISTS ***
  List<Widget> newMessagesList = [];
  List<Widget> addTimeContainer = [];
  // *** ADD NEW MESSAGE FUNCTION ***
  void _addMessage() {
    setState(() {
      // *** MINI TIME CONTAINER WILL BE ADDED ONCE ***
      if (isTimeContainerAdded == false) {
        isTimeContainerAdded = true;
        addTimeContainer.add(
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 224, 251, 224),
            ),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              child: Text(
                "Bugün",
                style: TextStyle(
                    color: const Color.fromARGB(255, 31, 96, 33),
                    fontSize: MediaQuery.of(context).size.width * 0.028),
              ),
            ),
          ),
        );
      }
      // *** MESSAGE BUBBLE ALL WILL BE ADDED ***
      newMessagesList.add(
        BubbleSpecialOne(
          delivered: true,
          text: _controller.text,
          textStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.038,
              fontWeight: FontWeight.w400),
          isSender: true,
          color: myMessagesColor(context),
        ),
      );
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // *** ÖNCEKİ SAYFADAN VERİ ÇEKME ***
    final Map<String, dynamic> personData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final bool personMessageState = personData["messageState"] as bool;
    final String personImage = personData['image'];
    final String personName = personData['name'];
    final String personMessage = personData['message'];
    return SafeArea(
      child: Stack(
        children: [
          // *** BACKGROUND IMAGE ***
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://w0.peakpx.com/wallpaper/946/21/HD-wallpaper-whatsapp-theme-background-green-original-simple-texture.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: const Color.fromARGB(0, 190, 190, 190),
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    iconSize: MediaQuery.of(context).size.width * 0.06,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Visibility(
                    visible: selectedMessageCount == 0,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.05,
                      backgroundImage: NetworkImage(personImage),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Text(
                    selectedMessageCount > 0
                        ? "$selectedMessageCount"
                        : personName,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.052),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              actions: [
                Visibility(
                  visible: selectedMessageCount > 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Ionicons.return_up_back,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
                Visibility(
                  visible: selectedMessageCount > 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star_border_rounded,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    selectedMessageCount > 0
                        ? Ionicons.trash_outline
                        : Icons.videocam_outlined,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    selectedMessageCount > 0
                        ? Ionicons.return_up_forward
                        : Icons.call,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // *** MESSAGES EXPANDED ***
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: [
                          // *** IMAGE MESSAGE ***
                          BubbleNormalImage(
                            id: "",
                            image: const Image(
                              image: AssetImage("assets/pictures/wpYellow.jpg"),
                            ),
                            isSender: false,
                            color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : const Color.fromARGB(255, 41, 54, 58),
                          ),
                          // *** MODEL MESSAGES ***
                          for (var Message in messages)
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onLongPress: () {
                                setState(() {
                                  if (Message.isSelected != true) {
                                    Message.isSelected = true;
                                    selectedMessageCount++;
                                  } else {
                                    null;
                                  }
                                });
                              },
                              onTap: () {
                                setState(() {
                                  if (Message.isSelected) {
                                    Message.isSelected = false;
                                    selectedMessageCount--;
                                  } else {
                                    Message.isSelected = true;
                                    selectedMessageCount++;
                                  }
                                });
                              },
                              child: Container(
                                color: Message.isSelected
                                    ? const Color.fromARGB(149, 38, 115, 64)
                                    : null,
                                width: MediaQuery.of(context).size.width,
                                child: BubbleSpecialOne(
                                  delivered:
                                      Message.myMessage == true ? true : false,
                                  text: Message.text,
                                  textStyle: TextStyle(
                                      color: Message.isSelected
                                          ? const Color.fromARGB(
                                              195, 125, 179, 143)
                                          : null,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.038,
                                      fontWeight: FontWeight.w400),
                                  isSender:
                                      Message.myMessage == true ? true : false,
                                  color: Message.myMessage == false
                                      ? otherPartyMessagesColor(context)
                                      : myMessagesColor(context),
                                ),
                              ),
                            ),
                          // *** PERSON LAST MESSAGE ***
                          InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onLongPress: () {
                              setState(() {
                                if (selectedMessage != true) {
                                  selectedMessage = true;
                                  selectedMessageCount++;
                                } else {
                                  null;
                                }
                              });
                            },
                            onTap: () {
                              setState(() {
                                if (selectedMessage == true) {
                                  selectedMessage = false;
                                  selectedMessageCount--;
                                } else {
                                  selectedMessage = true;
                                  selectedMessageCount++;
                                }
                              });
                            },
                            child: Container(
                              color: selectedMessage
                                  ? const Color.fromARGB(149, 38, 115, 64)
                                  : null,
                              width: MediaQuery.of(context).size.width,
                              child: BubbleSpecialOne(
                                delivered:
                                    personMessageState == true ? true : false,
                                text: personMessage,
                                textStyle: TextStyle(
                                    color: selectedMessage
                                        ? const Color.fromARGB(
                                            195, 125, 179, 143)
                                        : null,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.038,
                                    fontWeight: FontWeight.w400),
                                isSender:
                                    personMessageState == true ? true : false,
                                color: personMessageState == false
                                    ? otherPartyMessagesColor(context)
                                    : myMessagesColor(context),
                              ),
                            ),
                          ),
                          ...addTimeContainer,
                          ...newMessagesList
                        ],
                      ),
                    ),
                  ),
                  // *** BOTTOM TEXTFILED ***
                  SizedBox(
                    child: Row(
                      children: [
                        // *** TEXTFIELD EXPANDED ***
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.015,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width,
                                ),
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? ThemeClass.lightTheme.appBarColorLight
                                    : ThemeClass.darkTheme.appBarColorDark,
                              ),
                              child: Row(
                                children: [
                                  // *** ICON SMILE ***
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Ionicons.happy_outline,
                                      size: MediaQuery.of(context).size.width *
                                          0.07,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // *** TEXTFIELD "Mesaj" ***
                                  Expanded(
                                    flex: 7,
                                    child: TextField(
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      controller: _controller,
                                      decoration: const InputDecoration(
                                        hintText: 'Mesaj',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      cursorColor: const Color(0xFF00A884),
                                      onChanged: (text) {
                                        setState(() {
                                          if (textFieldState =
                                              text.trim().isNotEmpty) {
                                            textFieldState = true;
                                          } else {
                                            textFieldState = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  // *** CHANGING ICONS 1/2 ***
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      textFieldState == false
                                          ? Ionicons.attach_sharp
                                          : null,
                                      size: MediaQuery.of(context).size.width *
                                          0.07,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // *** CHANGING ICONS 2/2 ***
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "/camera_screen");
                                    },
                                    icon: Icon(
                                      textFieldState == true
                                          ? Ionicons.attach_sharp
                                          : Icons.camera_alt_outlined,
                                      size: MediaQuery.of(context).size.width *
                                          0.07,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // *** CHANGING ICONS MIC/SEND ***
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.024),
                                backgroundColor:
                                    const Color.fromARGB(255, 54, 173, 119)),
                            onPressed: () {
                              if (textFieldState == true) {
                                _addMessage();
                                textFieldState = false;
                              }
                            },
                            child: Icon(
                              textFieldState == true
                                  ? Icons.send
                                  : Icons.mic_outlined,
                              color: const Color.fromARGB(255, 239, 239, 239),
                              size: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // *** KARŞI TARAF MESAJ BALONCUĞU RENKLERİ ***
  Color otherPartyMessagesColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : const Color.fromARGB(255, 41, 54, 58);
  }

  // *** KENDİ MESAJ BALONCUĞU RENKLERİM ***
  Color myMessagesColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromARGB(255, 203, 248, 208)
        : const Color.fromARGB(255, 26, 111, 88);
  }
}
