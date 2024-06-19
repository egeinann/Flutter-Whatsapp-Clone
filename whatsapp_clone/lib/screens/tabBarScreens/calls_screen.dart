import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatsapp_clone/models/models.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  final List<Person> shuffledPersons = List.from(persons)..shuffle(Random());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            // *** TOP CARD ***
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: topCard(context),
            ),
            // *** TEXT "EN SON"***
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "En son",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // *** MID CONTACTS ***
            for (var Person in persons.reversed)
              contacts(context, Person),
            // *** SIZEDBOX ***
            SizedBox(height: MediaQuery.of(context).size.height * 0.1)
          ],
        ),
      ),
    );
  }

  // *** MID CONTACTS ***
  InkWell contacts(BuildContext context, Person Person) {
    return InkWell(
              onTap: (){},
              child: ListTile(
                leading: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.06,
                  backgroundImage: NetworkImage(Person.image),
                ),
                title: Text(
                  Person.name,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.042),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.arrow_outward,
                      color: const Color.fromARGB(255, 48, 141, 96),
                      size: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      Person.clock,
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.032),
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    print("---- user called : ${Person.name}");
                  },
                  icon: Icon(
                    Icons.phone_outlined,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ),
            );
  }

  // *** TOP CARD ***
  Row topCard(BuildContext context) {
    return Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.065,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 54, 173, 119),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Ionicons.link_sharp,
                    size: MediaQuery.of(context).size.width * 0.08,
                    color: Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Arama bağlantısı oluştur",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                      ),
                    ),
                    Text(
                      "Whatsapp'ta Arama için bağlantı paylaşın",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.034,
                      ),
                    ),
                  ],
                )
              ],
            );
  }
}
