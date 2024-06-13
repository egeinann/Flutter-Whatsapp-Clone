import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/customs/themes.dart';
import 'package:whatsapp_clone/screens/tabBarScreens/chats_screen/userchat_screen.dart';
import 'package:whatsapp_clone/screens/tabBarScreens/main_screen.dart';
import 'package:whatsapp_clone/screens/settingsScreens/settings_chats_screen.dart';
import 'package:whatsapp_clone/screens/tabBarScreens/camera_screen.dart';
import 'package:whatsapp_clone/screens/settingsScreens/settings_screen.dart';

void main() {
  // *** VERTICAL MODE ***
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const WhatsappClone());
  });
}

class WhatsappClone extends StatelessWidget {
  const WhatsappClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/main_screen",
            routes: {
              "/camera_screen": (context) => const CameraScreen(),
              "/main_screen": (context) => const MainScreen(),
              "/userchat_screen": (context) => const UserChatScreen(),
              "/settings_screen": (context) => const SettingsScreen(),
              "/settings_chats_screen": (context) =>
                  const SettingsChatsScreen(),
            },
            // *** PROVIDER THEMECLASS STATE MANAGEMENT ***
            // *** PROVIDER CLASS'I settings_chats_screen.dart DOSYASINDA ***
            theme: themeProvider.isDarkModeEnabled
                ? ThemeClass.darkTheme
                : ThemeClass.lightTheme,
          );
        },
      ),
    );
  }
}
