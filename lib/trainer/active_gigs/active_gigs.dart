// ignore: unused_import
// ignore_for_file: use_super_parameters

// ignore: unused_import
import 'dart:ffi';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../trainer_gig/trainer_gig.dart';

class ActiveGigs extends StatefulWidget {
  const ActiveGigs({Key? key}) : super(key: key);

  @override
  State<ActiveGigs> createState() => _ActiveGigsState();
}

class _ActiveGigsState extends State<ActiveGigs> {
  bool showTextField2 = false;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BJJ Training Pros',
          style: GoogleFonts.merriweather(
            fontSize: width * 0.05,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: SizedBox(
              width: width * 0.05,
              child: TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.notification_add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: const AppDrawer(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('services')
                        .where('user_id', isEqualTo: auth.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      }

                      final list = snapshot.data!.docs;

                      if (list.isEmpty) {
                        return Center(
                          child: Text(
                            'No Gigs Yet...',
                            style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final gig = list[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrainerGig(
                                    data: gig,
                                    fromTrainer: true,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromARGB(82, 255, 235, 238),
                              ),
                              child: Container(
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(auth.currentUser!.uid)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const SizedBox();
                                      }
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${snapshot.data!["userName"] ?? snapshot.data!["username"]}',
                                                style: GoogleFonts.merriweather(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: width * 0.05,
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Icon(
                                                Icons.check_circle_rounded,
                                                color: Colors.red,
                                                size: width * 0.04,
                                              ),
                                              const Spacer(),
                                              Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                                size: width * 0.04,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Text("Delivery:"),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "1-3 Days",
                                                style: GoogleFonts.merriweather(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Row(
                                            children: [
                                              Text(
                                                "Video Feedback",
                                                style: GoogleFonts.merriweather(
                                                    fontSize: width * 0.05,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.left,
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'images/tag.svg',
                                                    width: width * 0.05,
                                                  ),
                                                  const SizedBox(width: 8.0),
                                                  Text(
                                                    "Video Reviews",
                                                    style: GoogleFonts
                                                        .merriweather(
                                                      fontSize: width * 0.04,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(width: width * 0.1),
                                          Container(
                                            width: width * 0.2,
                                            height: height * 0.04,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: const Color.fromARGB(
                                                  133, 248, 187, 208),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "\$${gig['packages'].first['price']}.00",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
