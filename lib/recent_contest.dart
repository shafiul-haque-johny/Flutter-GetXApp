import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContest extends StatefulWidget {
  const RecentContest({Key? key}) : super(key: key);

  @override
  State<RecentContest> createState() => _RecentContestState();
}

class _RecentContestState extends State<RecentContest> {
  List info = [];

  readData() async {
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          'Recent Contests',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9294cc),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF69c5df),
      ),
      backgroundColor: const Color(0xFFC2E9EC),
      body: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < info.length; i++)
                      Container(
                        height: 240,
                        margin: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: InkWell(
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
                            width: width - 20,
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
                                      fontSize: 20,
                                      color: Color(0xFFb8eefc),
                                    ),
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
                                            borderRadius:
                                                BorderRadius.circular(25),
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
