import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'recent_contest.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List list = [];
  List info = [];

  readData() async {
    await DefaultAssetBundle.of(context).loadString('json/recent.json').then(
          (value) => setState(() {
            list = json.decode(value);
          }),
        );

    await DefaultAssetBundle.of(context).loadString('json/detail.json').then(
          (value) => setState(() {
            info = json.decode(value);
          }),
        );
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int currentIndex = 0;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        color: const Color(0xFFc5e5f3),
        child: Column(
          children: [
            // elon musk
            Container(
              width: width,
              height: 100,
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: const Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'images/background.jpg',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Elon Musk',
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
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        color: const Color(0xFFf3fafc),
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
            const SizedBox(height: 25),
            // popular contest
            Container(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Row(
                children: [
                  const Text(
                    'Popular Contest',
                    style: TextStyle(
                      color: Color(0xFF1f2326),
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Text(
                    "Show all",
                    style: TextStyle(
                      color: Color(0xff913fe3),
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: const Color(0xff913fe3),
                    ),
                    child: const InkWell(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // list
            Container(
              height: 240,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.88,
                ),
                itemCount: info.length,
                itemBuilder: (_, i) {
                  return InkWell(
                    onTap: () => Get.toNamed(
                      '/detail/',
                      arguments: {
                        'title': info[i]['title'].toString(),
                        'text': info[i]['text'].toString(),
                        'name': info[i]['name'].toString(),
                        'image': info[i]['image'].toString(),
                        'time': info[i]['time'].toString(),
                        'prize': info[i]['prize'].toString(),
                      },
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      height: 220,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        color: i.isEven
                            ? const Color(0xFF69c5df)
                            : const Color(0xFF9294cc),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  info[i]['title'],
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: width,
                            child: Text(
                              info[i]['text'],
                              style: const TextStyle(
                                  fontSize: 20, color: Color(0xFFb8eefc)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Divider(thickness: 1.0),
                          Row(
                            children: [
                              for (int i = 0; i < 4; i++)
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          info[i]['image'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //recent contests
            Container(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Row(
                children: [
                  const Text(
                    "Recent Contests",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Show all",
                    style: TextStyle(
                        color: Color(0xff913fe3),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff913fe3),
                    ),
                    child: InkWell(
                      onTap: () => Get.to(
                        () => RecentContest(),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    return Container(
                      width: width,
                      height: 95,
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFebf8fd),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                list[i]['image'],
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
                                  list[i]['status'],
                                  style: const TextStyle(
                                      color: Color(0xff913fe3),
                                      fontSize: 18,
                                      decoration: TextDecoration.none),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    list[i]['text'],
                                    style: const TextStyle(
                                      color: Color(0xFF3b3f42),
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Expanded(child: Container(),),
                            Container(
                              width: 40,
                              height: 70,
                              child: Text(
                                list[i]['time'],
                                style: const TextStyle(
                                  fontSize: 10,
                                  decoration: TextDecoration.none,
                                  color: Color(0xffb2b8bb),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
