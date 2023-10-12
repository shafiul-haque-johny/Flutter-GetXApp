import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/content_page.dart';
import 'package:getx_app/detail_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List images = [];

  readJsonData() async {
    await DefaultAssetBundle.of(context).loadString('json/image.json').then(
          (value) => setState(
            () {
              images = json.decode(value);
            },
          ),
        );
  }

  @override
  void initState() {
    readJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int currentIndex = 0;
    final DetailController fav = Get.put(DetailController());

    return Scaffold(
      body: Container(
        color: const Color(0xFFc5e5f3),
        child: Stack(
          children: [
            Positioned(
              top: 70,
              left: 10,
              child: IconButton(
                onPressed: () => Get.to(
                  () => ContentPage(),
                ),
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              height: 100,
              width: width,
              child: Container(
                width: width,
                height: 100,
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFebf8fd),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          Get.arguments['image'],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.arguments['name'],
                            style: const TextStyle(
                              color: Color(0xFF3b3f42),
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Top Level",
                            style: TextStyle(
                              color: Color(0xff913fe3),
                              fontSize: 12,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        width: 70,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xfff3fafc),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFF69c5df),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 335,
              left: 0,
              width: width,
              height: height,
              child: Container(
                width: 80,
                height: 80,
                color: const Color(0xFFf9fbfc),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              width: width,
              height: 280,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: width,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFfcfffe),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: Offset(0, 10),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              Get.arguments['title'],
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: width,
                        child: Text(
                          Get.arguments['text'],
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFFb8b8b8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.watch_later,
                                color: Color(0xFF69c5df),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Text(
                                    "Deadline",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFacacac),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.monetization_on,
                                color: Color(0xFFfb8483),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['prize'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Text(
                                    "Prize",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFacacac),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xff913fe3),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Top Level",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Entry",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFacacac),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 560,
              left: 25,
              height: 50,
              child: Container(
                child: RichText(
                  text: const TextSpan(
                    text: "Total Participants ",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: "(11)",
                        style: TextStyle(
                          color: Color(0xff913fe3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //images
            Stack(
              children: [
                for (int i = 0; i < images.length; i++)
                  Positioned(
                    top: 600,
                    left: (20 + i * 35).toDouble(),
                    width: 50,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(
                            images[i]['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            //favourite
            Positioned(
              top: 670,
              left: 25,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff913fe3),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () => fav.favoriteCounter(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Add to favorite",
                    style: TextStyle(
                      color: Color(0xff913fe3),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            //))
          ],
        ),
      ),
    );
  }
}
