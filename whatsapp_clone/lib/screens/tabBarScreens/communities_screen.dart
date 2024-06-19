import 'package:flutter/material.dart';

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          //  *** TOP CARD ***
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.03),
                              ),
                              child: Icon(
                                Icons.people_alt,
                                size: MediaQuery.of(context).size.width * 0.09,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.155,
                              height: MediaQuery.of(context).size.height * 0.085,
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
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Yeni Topluluk",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w500
                  ),
                  )
                ],
              ),
            ),
          ),
          // *** DIVIDER ***
          Divider(thickness: MediaQuery.of(context).size.height*0.004)
        ],
      ),
    );
  }
}
