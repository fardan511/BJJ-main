// ignore_for_file: use_build_context_synchronously

import 'package:bjj/login/login_page.dart';
import 'package:bjj/student/student_following.dart';
import 'package:bjj/student/student_dashboard/student_dashboard.dart';
import 'package:bjj/student/student_message.dart';
import 'package:bjj/student/student_project_wishlist.dart';
import 'package:bjj/student/student_services/student_ongoing_services.dart';
import 'package:bjj/student/student_verification.dart';
import 'package:bjj/student/student_wallet.dart';
import 'package:bjj/student/update_profile/update_student_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentAppDrawer extends StatelessWidget {
  const StudentAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: height * 0.30,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: height * 0.11,
                        height: height * 0.11,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          child: snapshot.data!['userImage'] != null &&
                                  snapshot.data!['userImage'].isNotEmpty
                              ? Image(
                                  image: NetworkImage(
                                    snapshot.data!['userImage'],
                                  ),
                                  height: height * 0.1,
                                  fit: BoxFit.cover,
                                )
                              : Image(
                                  image: const AssetImage(
                                    'images/admin.png',
                                  ),
                                  height: height * 0.1,
                                ),
                        ),
                      ),
                      SizedBox(height: height * 0.015),
                      Text(
                        '${snapshot.data!["userName"] ?? snapshot.data!["username"]}',
                        style: GoogleFonts.merriweather(
                          color: Colors.white,
                          fontSize: width * 0.035,
                        ),
                      ),
                      // const SizedBox(height: 5),
                      Text(
                        '${snapshot.data!["userEmail"] ?? snapshot.data!["email"]}',
                        style: GoogleFonts.merriweather(
                          color: Colors.white,
                          fontSize: width * 0.025,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              'Home',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentDashboard(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.person),
          //   title: Text(
          //     'Profile',
          //     style: GoogleFonts.merriweather(
          //       fontSize: width * 0.035,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const StudentEditProfile(),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.create_rounded),
            title: Text(
              'Edit Profile',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpdateStudentProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: Text(
              'Message',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentMessage(),
                ),
              );
            },
          ),
          // ExpansionTile(
          //   leading: const Icon(Icons.dashboard_customize),
          //   title: const Text('Project'),
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(left: width * 0.1),
          //       child: ListTile(
          //         title: const Text('Projects'),
          //         onTap: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const StudentProject(),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(left: width * 0.1),
          //       child: ListTile(
          //         title: const Text('Create a Project'),
          //         onTap: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const StudentCreateProject(),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(left: width * 0.1),
          //       child: ListTile(
          //         title: const Text('Ongoing Projects'),
          //         onTap: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const StudentOngoingProject(),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(left: width * 0.1),
          //       child: ListTile(
          //         title: const Text('Cancelled Project'),
          //         onTap: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const StudentCencelProject(),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(left: width * 0.1),
          //       child: ListTile(
          //         title: const Text('Complete Project'),
          //         onTap: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const StudentCompleteProject(),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          // ExpansionTile(
          //   leading: const Icon(Icons.pin_end),
          //   title: Text(
          //     'Services',
          //     style: GoogleFonts.merriweather(
          //       fontSize: width * 0.035,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(left: width * 0.1),
          //       child: ListTile(
          //         title: Text(
          //           'Ongoing Services',
          //           style: GoogleFonts.merriweather(
          //             fontSize: width * 0.030,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //         onTap: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const StudentOngoingServices(),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //     // Padding(
          //     //   padding: EdgeInsets.only(left: width * 0.1),
          //     //   child: ListTile(
          //     //     title: const Text('Cencelled Services'),
          //     //     onTap: () {
          //     //       Navigator.pushReplacement(
          //     //         context,
          //     //         MaterialPageRoute(
          //     //           builder: (context) => const StudentCancelledServices(),
          //     //         ),
          //     //       );
          //     //     },
          //     //   ),
          //     // ),
          //     // Padding(
          //     //   padding: EdgeInsets.only(left: width * 0.1),
          //     //   child: ListTile(
          //     //     title: const Text('Complete Services'),
          //     //     onTap: () {
          //     //       Navigator.pushReplacement(
          //     //         context,
          //     //         MaterialPageRoute(
          //     //           builder: (context) => const StudentCompleteServices(),
          //     //         ),
          //     //       );
          //     //     },
          //     //   ),
          //     // ),
          //   ],
          // ),
          ListTile(
            leading: const Icon(Icons.wallet),
            title: Text(
              'Wallet',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentWallet(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text(
              'Services Wishlist',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentProjectsWishlist(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_2),
            title: Text(
              'Following Trainers',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentFollowing(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.security),
          //   title: Text(
          //     'Disputes',
          //     style: GoogleFonts.merriweather(
          //       fontSize: width * 0.035,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const StudentDispute(),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.verified),
            title: Text(
              'Verification',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentVerification(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Logout',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Logout',
                      style: GoogleFonts.merriweather(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      'Are you sure you want to logout?',
                      style: GoogleFonts.merriweather(),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.030,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade800,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          try {
                            await auth.signOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          } catch (e) {
                            // ignore: avoid_print
                            print("Error during sign out: $e");
                          }
                        },
                        child: Text(
                          'Logout',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.030,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade800,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
