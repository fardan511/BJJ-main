import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../trainer/trainer_projects/project_details.dart';

class TrainerProjectScreen extends StatefulWidget {
  final String trainerId;
  const TrainerProjectScreen({
    super.key,
    required this.trainerId,
  });

  @override
  State<TrainerProjectScreen> createState() => _TrainerProjectState();
}

class _TrainerProjectState extends State<TrainerProjectScreen> {
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
      drawer: const StudentAppDrawer(),
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
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(widget.trainerId)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const SizedBox();
                            }
                            return Column(
                              children: [
                                Container(
                                  width: height * 0.2,
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Adjust the value as needed
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      30.0,
                                    ),
                                    child:
                                        snapshot.data!['userImage'] != null &&
                                                snapshot.data!['userImage']
                                                    .isNotEmpty
                                            ? Image(
                                                image: NetworkImage(
                                                  snapshot.data!['userImage'],
                                                ),
                                                fit: BoxFit.cover,
                                              )
                                            : const Image(
                                                image: AssetImage(
                                                  'images/admin.png',
                                                ),
                                                height: 100,
                                              ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${snapshot.data!["userName"] ?? snapshot.data!["username"]}',
                                  style: GoogleFonts.merriweather(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${snapshot.data!["userEmail"] ?? snapshot.data!["email"]}',
                                  style: GoogleFonts.merriweather(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.035,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            );
                          },
                        ),
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
                    'Project',
                    style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.bold, fontSize: width * 0.05),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('projects')
                    .where('userId', isEqualTo: widget.trainerId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }

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
                          style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.03),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TrainerProjectDetails(
                                    data: snapshot.data!.docs[index]),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['projectTitle'],
                                  style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  snapshot.data!.docs[index]['description'],
                                  style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.03),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Duration: ${snapshot.data!.docs[index]['projectDuration']}",
                                      style: GoogleFonts.merriweather(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.03),
                                    ),
                                    const SizedBox(width: 12.0),
                                    Text(
                                      "Price: \$${snapshot.data!.docs[index]['price']}",
                                      style: GoogleFonts.merriweather(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.03),
                                    ),
                                  ],
                                ),
                              ],
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
