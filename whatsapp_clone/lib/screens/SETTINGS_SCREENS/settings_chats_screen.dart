import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsChatsScreen extends StatefulWidget {
  const SettingsChatsScreen({super.key});

  @override
  State<SettingsChatsScreen> createState() => _SettingsChatsScreenState();
}

// *** DARK-LIGHT STATE MANAGEMENT PROVIDER CLASS
class ThemeProvider with ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void toggleDarkMode(bool value) {
    _isDarkModeEnabled = value;
    notifyListeners();
  }
}

class _SettingsChatsScreenState extends State<SettingsChatsScreen> {
  // switch widgeti için değişkenler
  bool isSwitchedTheme = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = true;
  @override
  Widget build(BuildContext context) {
    String wpDurum = isSwitchedTheme ? "koyu" : "açık";
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sohbetler",
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // *** GÖRÜNTÜLENME ***
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Görüntüleme",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    // *** tema ***
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Icon(
                                Icons.brightness_6_outlined,
                                size: MediaQuery.of(context).size.width * 0.07,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tema",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.038)),
                                Text(wpDurum,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035)),
                              ],
                            ),
                          ],
                        ),
                        Switch(
                          thumbColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors
                                    .white; // Açık durumdayken başparmak rengi
                              }
                              return Colors
                                  .grey; // Kapalı durumdayken başparmak rengi
                            }),
                          activeColor: Color.fromARGB(255, 28, 59, 201),
                          value: themeProvider.isDarkModeEnabled,
                          onChanged: (value) {
                            themeProvider.toggleDarkMode(value);
                            setState(() {
                              isSwitchedTheme = !isSwitchedTheme;
                            });
                          },
                        ),
                      ],
                    ),
                    // *** Duvar kağıdı ***
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Icon(
                            Icons.photo_outlined,
                            size: MediaQuery.of(context).size.width * 0.07,
                          ),
                        ),
                        Text("Duvar kağıdı",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.038))
                      ],
                    ),
                    Divider(
                      thickness: MediaQuery.of(context).size.width * 0.001,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            // *** SOHBET AYARLARI ***
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Sohbet ayarları",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    // *** enter tuşu gönderir ***
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.035),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Enter tuşu gönderir",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.038),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Enter tuşu mesajınızı gönderecek",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Switch(
                            thumbColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors
                                    .white; // Açık durumdayken başparmak rengi
                              }
                              return Colors
                                  .grey; // Kapalı durumdayken başparmak rengi
                            }),
                            activeTrackColor: Colors.green,
                            value: isSwitched1,
                            onChanged: (value) {
                              setState(() {
                                isSwitched1 = value;
                              });
                            })
                      ],
                    ),
                    // *** medya görünürlüğü ***
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.035),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Medya görünürlüğü",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.038),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "İndirilen medyaları cihaza kaydeder",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          thumbColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors
                                    .white; // Açık durumdayken başparmak rengi
                              }
                              return Colors
                                  .grey; // Kapalı durumdayken başparmak rengi
                            }),
                            activeTrackColor: Colors.green,
                            value: isSwitched2,
                            onChanged: (value) {
                              setState(() {
                                isSwitched2 = value;
                              });
                            })
                      ],
                    ),
                    // *** yazı tipi boyutu ***
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.035),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yazı tipi boyutu",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.038),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Küçük",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: MediaQuery.of(context).size.width * 0.001,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            // *** ARŞİVLENMİŞ SOHBETLER ***
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Arşivlenmiş sohbetler",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    // *** enter tuşu gönderir ***
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.035),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sohbetleri arşivde tut",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.038),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Arşivlenen sohbetler her zaman \nsohbette kalır",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          thumbColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors
                                    .white; // Açık durumdayken başparmak rengi
                              }
                              return Colors
                                  .grey; // Kapalı durumdayken başparmak rengi
                            }),
                            activeTrackColor: Colors.green,
                            value: isSwitched3,
                            onChanged: (value) {
                              setState(() {
                                isSwitched3 = value;
                              });
                            })
                      ],
                    ),
                    Divider(
                      thickness: MediaQuery.of(context).size.width * 0.001,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            // *** BOTTOM SETTINGS ***
            // *** sohbet yedeği ***
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cloud_download_outlined,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text("Sohbet yedeği",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035))
                    ],
                  ),
                ),
                // *** sohbetleri aktarma ***
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phonelink_ring,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text("Sohbetleri aktarma",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035))
                    ],
                  ),
                ),
                // *** sohbet geçmişi ***
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text("Sohbet geçmişi",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
