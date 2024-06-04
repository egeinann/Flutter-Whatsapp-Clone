import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatsapp_clone/screens/MAIN_SCREEN/calls_screen.dart';
import 'package:whatsapp_clone/screens/MAIN_SCREEN/chats_screen.dart';
import 'package:whatsapp_clone/screens/MAIN_SCREEN/communities_screen.dart';
import 'package:whatsapp_clone/screens/MAIN_SCREEN/updates_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  // *** TAB CONTROLLER ***
  late TabController _tabController;
  int _selectedTabBar = 0;
  final List<IconData> icons = [
    Icons.add_comment,
    Icons.camera_alt,
    Icons.notifications,
    Icons.call,
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _selectedTabBar = _tabController.index;
    });
  }

  // *** CHANGING TITLE TEXT ***
  String changeTitle() {
    if (_selectedTabBar == 0) {
      return "Whatsapp";
    } else if (_selectedTabBar == 1) {
      return "Güncellemeler";
    } else if (_selectedTabBar == 2) {
      return "Topluluklar";
    } else {
      return "Aramalar";
    }
  }

  // *** POPUPMENU ITEMS ***
  String item1 = "Yeni grup";
  String item2 = "Yeni toplu mesaj";
  String item3 = "Bağlı cihazlar";
  String item4 = "Yıldızlı mesajlar";
  String item5 = "Ayarlar";
  // *** TAB BAR SELECTEDS ***
  bool isSelectedSohbetler = false;
  bool isSelectedGunceleme = false;
  bool isSelectedTopluluk = false;
  bool isSelectedAramalar = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          // *** TOP BAR ***
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            title: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.height * 0.01),
                Text(
                  changeTitle(),
                  style: _selectedTabBar == 0
                      ? TextStyle(
                          color: const Color.fromARGB(255, 54, 173, 119),
                          fontSize: MediaQuery.of(context).size.width * 0.075,
                          fontWeight: FontWeight.w600)
                      : TextStyle(
                          color: null,
                          fontSize: MediaQuery.of(context).size.width * 0.055,
                          fontWeight: FontWeight.w400),
                )
              ],
            ),
            actions: [
              IconButton(
                iconSize: MediaQuery.of(context).size.width * 0.065,
                onPressed: () {
                  _selectedTabBar == 0 ||
                          _selectedTabBar == 1 ||
                          _selectedTabBar == 3
                      ? Navigator.pushNamed(context, "/camera_screen")
                      : null;
                },
                icon: Icon(
                    _selectedTabBar == 2 ? null : Icons.camera_alt_outlined),
              ),
              IconButton(
                iconSize: MediaQuery.of(context).size.width * 0.065,
                onPressed: () {
                  _selectedTabBar == 2
                      ? Navigator.pushNamed(context, "/camera_screen")
                      : null;
                },
                icon: Icon(_selectedTabBar == 2
                    ? Icons.camera_alt_outlined
                    : Ionicons.search_sharp),
              ),
              PopupMenuButton<String>(
                iconSize: MediaQuery.of(context).size.width * 0.06,
                icon: const Icon(Ionicons.ellipsis_vertical_sharp),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    child: Text(
                      'Yeni grup',
                    ),
                  ),
                  const PopupMenuItem<String>(
                    child: Text(
                      'Yeni toplu mesaj',
                    ),
                  ),
                  const PopupMenuItem<String>(
                    child: Text(
                      'Bağlı cihazlar',
                    ),
                  ),
                  const PopupMenuItem<String>(
                    child: Text(
                      'Yıldızlı mesajlar',
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: const Text(
                      'Ayarlar',
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/settings_screen");
                    },
                  ),
                ],
              )
            ],
          ),
          // *** MID SCREEN ***
          body: Stack(
            children: [
              TabBarView(
                controller: _tabController,
                children: const [
                  // *** CHATS BAR ***
                  ChatsScreen(),
                  // *** UPDATES BAR ***
                  UpdatesScreen(),
                  // *** COMMUNTİTİES BAR ***
                  CommunitiesScreen(),
                  // *** CALLS BAR ***
                  CallsScreen()
                ],
              ),
              // *** CHANGING BOTTOM-RIGHT GREEN BUTTON ***
              Visibility(
                visible: _selectedTabBar != 2,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    child: InkWell(
                      onTap: () {
                        print("GreenBox");
                        _selectedTabBar == 1
                            ? Navigator.pushNamed(context, "/camera_screen")
                            : null;
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 54, 173, 119),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.05),
                        ),
                        child: Icon(icons[_selectedTabBar],
                            size: MediaQuery.of(context).size.width * 0.07,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // *** BOTTOM  TAB BAR ***
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height * 0.128,
            child: BottomAppBar(
              child: TabBar(
                splashFactory: NoSplash.splashFactory,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.0001),
                controller: _tabController,
                indicator: const BoxDecoration(),
                dividerHeight: 0,
                tabs: [
                  // *** TAB BAR 0 SOHBETLER ***
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).dialogBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.08),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: _selectedTabBar == 0
                                    ? MediaQuery.of(context).size.width * 0.18
                                    : MediaQuery.of(context).size.width * 0),
                          ),
                          Center(
                            child: Icon(
                              _selectedTabBar == 0
                                  ? Icons.chat
                                  : Icons.chat_outlined,
                              size: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Sohbetler",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  // *** TAB BAR 1 GÜNCELLEMELER ***
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).dialogBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.08),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: _selectedTabBar == 1
                                    ? MediaQuery.of(context).size.width * 0.18
                                    : MediaQuery.of(context).size.width * 0),
                          ),
                          Center(
                            child: Icon(
                              _selectedTabBar == 1
                                  ? Icons.donut_small_sharp
                                  : Icons.data_usage_rounded,
                              size: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Güncelleme",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  // *** TAB BAR 2 TOPLULUKLAR ***
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).dialogBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.08),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: _selectedTabBar == 2
                                    ? MediaQuery.of(context).size.width * 0.18
                                    : MediaQuery.of(context).size.width * 0),
                          ),
                          Center(
                            child: Icon(
                              _selectedTabBar == 2
                                  ? Ionicons.people
                                  : Ionicons.people_outline,
                              size: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Topluluklar",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  // *** TAB BAR 3 ARAMALAR ***
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).dialogBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.08),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: _selectedTabBar == 3
                                    ? MediaQuery.of(context).size.width * 0.18
                                    : MediaQuery.of(context).size.width * 0),
                          ),
                          Center(
                            child: Icon(
                              _selectedTabBar == 3
                                  ? Ionicons.call
                                  : Ionicons.call_outline,
                              size: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Aramalar",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
