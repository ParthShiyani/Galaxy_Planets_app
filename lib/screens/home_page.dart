import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff3E3963),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {},
        ),
        title: const Text(
          "Galaxy Planet",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: Global.planetDetails.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('details_page',
                    arguments: Global.planetDetails[i]);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 68),
                height: 180,
                width: width,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 160,
                      width: width * 0.78,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff434280),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 1,
                            spreadRadius: 0.1,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const SizedBox(width: 80),
                              Text(
                                Global.planetDetails[i]["name"],
                                style: const TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.more_vert_rounded,
                                color: Colors.white.withOpacity(0.3),
                                size: 25,
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 3),
                            child: Text(
                              "Milkyway Galaxy",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                          const Divider(
                            color: Colors.blue,
                            endIndent: 180,
                            indent: 80,
                            thickness: 3,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const SizedBox(width: 80),
                              Icon(
                                Icons.location_on,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              Text(
                                "${Global.planetDetails[i]["surface_area"]}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.swap_vert,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              Text(
                                "${Global.planetDetails[i]["gravity"]}",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(-1.4, 0),
                      child: RotationTransition(
                        turns: animationController,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "${Global.planetDetails[i]["image"]}",
                          fit: BoxFit.fill,
                          height: 110,
                          width: 110,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
