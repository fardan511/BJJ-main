import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../trainer_gig/trainer_gig.dart';

class TrainerOngoingServices extends StatefulWidget {
  const TrainerOngoingServices({Key? key}) : super(key: key);

  @override
  State<TrainerOngoingServices> createState() => _TrainerOngoingServicesState();
}

class _TrainerOngoingServicesState extends State<TrainerOngoingServices> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BJJ Training Pros',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(children: [
                          Image.asset('images/admin.png'),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'admin',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 0.035 * width,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Admin@trainingpros.com',
                            style: TextStyle(
                              fontSize: 0.035 * width,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(162, 209, 14, 14),
                                  Color.fromARGB(139, 248, 3, 3),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Text(
                                'View Profile',
                                style: GoogleFonts.poppins(
                                  fontSize: 0.032 * width,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: width * 0.9,
                height: height * 0.1,
                child: Center(
                  child: Text(
                    'Ongoing',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.05),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('services')
                    .where('user_id',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox();

                  if (snapshot.data!.docs.isEmpty) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: width * 0.9,
                      height: height * 0.1,
                      child: Center(
                        child: Text(
                          'No result found!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.03),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.docs[index];
                      return Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrainerGig(
                                  data: data,
                                  fromTrainer: true,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.05),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        data['trainer_name'],
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: Colors.red,
                                        size: width * 0.04, // Set the icon size
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: width * 0.04, // Set the icon size
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
                                        data['package']['delivery_time'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        data['service_title'],
                                        style: TextStyle(
                                            fontSize: width * 0.05,
                                            fontWeight: FontWeight.bold),
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
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'images/tag.svg',
                                                width: width *
                                                    0.05, // Set the width of the SVG
                                              ),
                                              const SizedBox(width: 8.0),
                                              Text(
                                                "Video Reviews",
                                                style: TextStyle(
                                                  fontSize: width * 0.04,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(width: width * 0.1),
                                      Container(
                                        width: width * 0.15,
                                        height: height * 0.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: const Color.fromARGB(
                                              133, 248, 187, 208),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "\$${data['package']['price']}.00",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
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
      ),
    );
  }
}
