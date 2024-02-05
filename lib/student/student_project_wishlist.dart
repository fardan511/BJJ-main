import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentProjectsWishlist extends StatefulWidget {
  const StudentProjectsWishlist({Key? key}) : super(key: key);

  @override
  State<StudentProjectsWishlist> createState() =>
      _StudentProjectsWishlistState();
}

class _StudentProjectsWishlistState extends State<StudentProjectsWishlist> {
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
                              .doc(auth.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const SizedBox();
                            }
                            return Column(
                              children: [
                                // Image.asset('images/admin.png'),
                                // const SizedBox(
                                //   height: 25,
                                // ),
                                // Text(
                                //   'Student',
                                //  style: GoogleFonts.merriweather(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 0.035 * width,
                                //   ),
                                // ),
                                // const SizedBox(
                                //   height: 25,
                                // ),
                                // Text(
                                //   'Student@trainingpros.com',
                                //  style: GoogleFonts.merriweather(
                                //     fontSize: 0.035 * width,
                                //   ),
                                // ),
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
                                Container(
                                  width: width * 0.35,
                                  height: height * 0.06,
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
                                      style: GoogleFonts.merriweather(
                                        fontSize: 0.032 * width,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
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
                    'Project Wishlist',
                    style: GoogleFonts.merriweather(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: width * 0.9,
                    height: height * 0.1,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.05),
                      child: Text(
                        'No Result found!',
                        style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.03),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
