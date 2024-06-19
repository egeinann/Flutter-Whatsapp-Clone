import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/models.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool animatedContainer = false;
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width * 0.3; // Başlangıç yüksekliği
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // ** TOP EXPANDED ***
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                    iconSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.flash_off),
                    color: Colors.white,
                    iconSize: MediaQuery.of(context).size.width * 0.06,
                  )
                ],
              ),
            ),
            // ** MID CAMERA EXPANDED ***
            Expanded(
              flex: 16,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 0) {
                    // Aşağı doğru kaydırma algılandı
                    setState(() {
                      animatedContainer = true; // AnimatedContainer'ı aç
                    });
                  } else if (details.delta.dy < 0) {
                    // Yukarı doğru kaydırma algılandı
                    setState(() {
                      animatedContainer = false; // AnimatedContainer'ı kapat
                    });
                  }
                },
                child: Container(
                  color: Colors.black,
                  child: Center(
                      child: Text(
                    "-Emülatör !\nkameraya erişim iznin yok.",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04),
                  )),
                ),
              ),
            ),
            // ** MID LINE BUTTON EXPANDED ***
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    animatedContainer = !animatedContainer;
                  });
                },
                icon: Icon(
                    animatedContainer
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.horizontal_rule_rounded,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08),
              ),
            ),
            // *** MID GALLERY EXPANDED ***
            AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              height: animatedContainer == true
                  ? MediaQuery.of(context).size.width * 0
                  : MediaQuery.of(context).size.width * 0.25,
              duration: const Duration(milliseconds: 200),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var Gallery in photos)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: MediaQuery.of(context).size.width * 0.22,
                          child: Image(
                            image: NetworkImage(Gallery.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Container(
                        color: Colors.grey.shade800,
                        width: MediaQuery.of(context).size.width * 0.22,
                        height: MediaQuery.of(context).size.width * 0.22,
                        child: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.green.shade200,
                          size: MediaQuery.of(context).size.width * 0.1,
                        ))
                  ],
                ),
              ),
            ),
            // ** MID BUTTONS EXPANDED ***
            Expanded(
              flex: 4,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_camera_back),
                      color: Colors.white,
                      iconSize: MediaQuery.of(context).size.width * 0.07,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.circle),
                      color: Colors.white,
                      iconSize: MediaQuery.of(context).size.width * 0.22,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.cameraswitch),
                      color: Colors.white,
                      iconSize: MediaQuery.of(context).size.width * 0.07,
                    )
                  ],
                ),
              ),
            ),
            // ** BOTTOM CHANGE EXPANDED ***
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 27, 26, 33),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01,horizontal: MediaQuery.of(context).size.width * 0.2),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Colors.transparent),
                      child: Center(
                        child: Text(
                          "Video",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: const Color.fromARGB(255, 38, 39, 50)),
                        child: Center(
                          child: Text(
                            "Fotoğraf",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
