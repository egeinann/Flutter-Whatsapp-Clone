import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatsapp_clone/models/models.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ayarlar",
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search,
                  size: MediaQuery.of(context).size.height * 0.035),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  // *** TOP LISTILE ***
                  Expanded(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.08,
                        backgroundImage: const NetworkImage(
                            "https://media.istockphoto.com/id/1451587807/tr/vekt%C3%B6r/user-profile-icon-vector-avatar-or-person-icon-profile-picture-portrait-symbol-vector.jpg?s=612x612&w=0&k=20&c=10jkKmegVjOg1XDH4ZOe1gWcFiJuPywWVLPq4Ndl6TQ="),
                      ),
                      title: Text("ege",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),),
                      subtitle: Text("Toplantıda",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.036),),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.qr_code_scanner,
                              size: MediaQuery.of(context).size.width * 0.07,
                              color: const Color.fromARGB(255, 45, 154, 105),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.expand_circle_down_outlined,
                              size: MediaQuery.of(context).size.width * 0.07,
                              color: const Color.fromARGB(255, 45, 154, 105),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // *** DIVIDER ***
              Divider(
                color: Colors.black,
                thickness: MediaQuery.of(context).size.height * 0.0002,
              ),
              // *** SETTINGS ***
              for (var Setting in settings)
                InkWell(
                  onTap: () {
                    Setting.title == "Sohbetler"
                        ? Navigator.pushNamed(context, "/settings_chats_screen")
                        : null;
                  },
                  child: ListTile(
                    leading: Setting.icon,
                    title: Text(Setting.title,style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),),
                    subtitle: Text(Setting.subtitle,style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.034),),
                    minVerticalPadding: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              // *** BOTTOM TEXTS ***
              Text("from",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.infinite,
                    size: MediaQuery.of(context).size.height * 0.035,
                  ),
                  Text("Meta",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
