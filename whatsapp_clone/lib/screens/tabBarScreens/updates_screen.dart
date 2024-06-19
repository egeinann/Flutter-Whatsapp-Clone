import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/models.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // **** SITUATION TEXT ***
            widgetTitles("Durum",Icons.more_vert),
            // *** SITUATIONS HORIZONTAL SCROLL ***
            situationsRowScroll(context),
            // *** DIVIDER ***
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            // **** CHANNELS TEXT ***
            widgetTitles("Kanallar",Icons.add),
            // *** CHANNELS ***
            for (var channel in channels)
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                child: channelsList(context, channel),
              ),
            // *** TEXTS POSTERS ***
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kanal bul",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        "Tümünü gör",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 54, 173, 119),
                            fontSize: MediaQuery.of(context).size.width * 0.032,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: const Color.fromARGB(255, 54, 173, 119),
                        size: MediaQuery.of(context).size.width * 0.05,
                      )
                    ],
                  )
                ],
              ),
            ),
            // *** POSTERS ***
            postersList(context),
            // *** SIZEDBOX BOTTOM ***
            SizedBox(height: MediaQuery.of(context).size.height * 0.12)
          ],
        ),
      ),
    );
  }

  // WIDGET TITLES BAŞLIKLAR ***
  Padding widgetTitles(String title,IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(icon,
                  size: 30),)
        ],
      ),
    );
  }

  // *** POSTERS ***
  SizedBox postersList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var Poster in posters)
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).size.width *
                        0.0009,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).size.height *
                        0.00035,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width *
                                  0.03), // Köşeleri yuvarlama
                        ),
                      ),
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.07,
                                backgroundImage: NetworkImage(Poster.image),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.14,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.07,
                                    width: MediaQuery.of(context).size.height *
                                        0.035,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 54, 173, 119)),
                                    child: Icon(
                                      Icons.done,
                                      size: MediaQuery.of(context).size.width *
                                          0.05,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            Poster.name,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Takip",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // *** CHANNELS ***
  ListTile channelsList(BuildContext context, Channel channel) {
    return ListTile(
      leading: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.06,
        backgroundImage: NetworkImage(channel.image),
      ),
      title: Text(channel.name,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.width * 0.042)),
      subtitle: Text(
        channel.message,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035),
      ),
      trailing: Text(
        channel.time,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
      ),
    );
  }

  // *** SITUATIONS SCROLL ***
  SingleChildScrollView situationsRowScroll(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // *** DURUMUM ***
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/camera_screen");
            },
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.04,
                    backgroundImage: NetworkImage(persons[0].image),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.add_circle_rounded,
                        size: MediaQuery.of(context).size.height * 0.035,
                        color: const Color.fromARGB(255, 54, 173, 119),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Durumum",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // *** MORE USERS SITUATIONS ***
          for (int index = 0;
              index < persons.sublist(persons.length - 8).length;
              index++)
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.005),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 54, 173, 119), // Kenarlık rengi
                          width: 3, // Kenarlık kalınlığı
                        ),
                      ),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.04,
                        backgroundImage: NetworkImage(
                            persons.sublist(persons.length - 8)[index].image),
                      ),
                    ),
                  ),
                  Text(
                    persons.sublist(persons.length - 8)[index].name,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
