import 'dart:math';

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff3E3963),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  color: const Color(0xff434280),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        height: height * 0.08,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Welcome to ${res['name']}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        "${res["image"]}",
                        fit: BoxFit.fill,
                        height: 120,
                        width: 120,
                      ),
                      Spacer(),
                      Text(
                        "Distance to Sun",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "${res['distance_sun']}",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Distance to Earth",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "${res['distance_earth']}",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                );
              });
        },
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          width: width,
          height: height * 0.08,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "START FROM",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "\$ 2.8m",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "BOOK NOW",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.5),
              )
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  width: height,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                      color: const Color(0xff434280),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.5,
                          blurRadius: 15,
                        ),
                      ]),
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        res["name"],
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Milkyway Galaxy",
                        style: TextStyle(
                            fontSize: 17, color: Colors.white.withOpacity(0.5)),
                      ),
                      const Divider(
                        color: Colors.blue,
                        endIndent: 160,
                        indent: 170,
                        thickness: 3,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.location_on,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Text(
                            " ${res["surface_area"]}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 35),
                          Icon(
                            Icons.swap_vert,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Text(
                            " ${res["gravity"]}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0),
                  child: RotationTransition(
                    turns: animationController,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "${res["image"]}",
                      fit: BoxFit.fill,
                      height: 130,
                      width: 130,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "OVERVIEW",
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 20,
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
            const Divider(
              color: Colors.blue,
              endIndent: 320,
              thickness: 3,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(14),
              width: width,
              child: Text(
                "${res['overview']}",
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
