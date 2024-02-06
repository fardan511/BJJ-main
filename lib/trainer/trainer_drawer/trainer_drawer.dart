// ignore_for_file: use_build_context_synchronously, unused_import

import 'package:bjj/login/login_page.dart';
import 'package:bjj/models/trainer_model.dart';
import 'package:bjj/trainer/active_gigs/active_gigs.dart';
import 'package:bjj/trainer/trainer_dashboard.dart';
import 'package:bjj/trainer/trainer_services/cancelled_services.dart';
import 'package:bjj/trainer/trainer_services/complete_services.dart';
import 'package:bjj/trainer/trainer_services/create_services.dart';
import 'package:bjj/trainer/trainer_services/ongoing_services.dart';
import 'package:bjj/trainer/trainer_dispute.dart';
import 'package:bjj/trainer/trainer_edit_profile.dart';
import 'package:bjj/trainer/trainer_following.dart';
import 'package:bjj/trainer/trainer_homescreen/trainer_homescreen.dart';
import 'package:bjj/trainer/trainer_message.dart';
import 'package:bjj/trainer/trainer_project_wishlist.dart';
import 'package:bjj/trainer/trainer_projects/complete_project.dart';
import 'package:bjj/trainer/trainer_projects/create_project.dart';
import 'package:bjj/trainer/trainer_projects/on_going_project.dart';
import 'package:bjj/trainer/trainer_projects/trainer_cancel_project.dart';
import 'package:bjj/trainer/trainer_projects/trainer_project.dart';
import 'package:bjj/trainer/trainer_verification.dart';
import 'package:bjj/trainer/trainer_wallet.dart';
import 'package:bjj/trainer/update_profile/update_trainer_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bjj_trainers/trainer_screen.dart';
import '../../bjj_trainers/trainer_screen_2.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: height * 0.27,
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
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.035,
                        ),
                      ),
                      // const SizedBox(height: 5),
                      Text(
                        '${snapshot.data!["userEmail"] ?? snapshot.data!["email"]}',
                        style: TextStyle(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TrainerHomescreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_customize),
            title: Text(
              'Dashboard',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const TrainerDashboard(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Create Profile',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const TrainerEditProfile(),
                ),
              );
            },
          ),
          FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(auth.currentUser!.uid)
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                }
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    'My Profile',
                    style: GoogleFonts.merriweather(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrainerScreen2(
                          trainer:
                              TrainerModel.fromJson(snapshot.data!.data()!),
                        ),
                      ),
                    );
                  },
                );
              }),
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
                  builder: (context) => const UpdateTrainerProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box_rounded),
            title: Text(
              'My Active Gigs',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ActiveGigs(),
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
                  builder: (context) => const TrainerMessage(),
                ),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.dashboard_customize),
            title: Text(
              'Project',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: ListTile(
                  title: Text(
                    'Projects',
                    style: GoogleFonts.merriweather(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrainerProject(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: ListTile(
                  title: Text(
                    'Create a Project',
                    style: GoogleFonts.merriweather(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrainerCreateProject(),
                      ),
                    );
                  },
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.1),
              //   child: ListTile(
              //     title: Text(
              //       'Ongoing Projects',
              //       style: GoogleFonts.merriweather(
              //         fontSize: width * 0.035,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const TrainerOngoingProject(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.1),
              //   child: ListTile(
              //     title: Text(
              //       'Cancelled Project',
              //       style: GoogleFonts.merriweather(
              //         fontSize: width * 0.035,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const TrainerCencelProject(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.1),
              //   child: ListTile(
              //     title: Text(
              //       'Complete Project',
              //       style: GoogleFonts.merriweather(
              //         fontSize: width * 0.035,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const TrainerCompleteProject(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.pin_end),
            title: Text(
              'Services',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: ListTile(
                  title: Text(
                    'Create a Service',
                    style: GoogleFonts.merriweather(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrainerCreateServices(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: ListTile(
                  title: Text(
                    'View Services',
                    style: GoogleFonts.merriweather(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActiveGigs(),
                      ),
                    );
                  },
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.1),
              //   child: ListTile(
              //     title: Text(
              //       'Ongoing Services',
              //       style: GoogleFonts.merriweather(
              //         fontSize: width * 0.035,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const TrainerOngoingServices(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.1),
              //   child: ListTile(
              //     title: Text(
              //       'Cencelled Services',
              //       style: GoogleFonts.merriweather(
              //         fontSize: width * 0.035,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const CancelledServices(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.1),
              //   child: ListTile(
              //     title: Text(
              //       'Complete Services',
              //       style: GoogleFonts.merriweather(
              //         fontSize: width * 0.035,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const CompleteServices(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
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
                  builder: (context) => const TrainerWallet(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.add),
          //   title: Text(
          //     'Services Wishlist',
          //     style: GoogleFonts.merriweather(
          //       fontSize: width * 0.035,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const TrainerProjectsWishlist(),
          //       ),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.person_2),
          //   title: Text(
          //     'Following Trainers',
          //     style: GoogleFonts.merriweather(
          //       fontSize: width * 0.035,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const TrainerFollowing(),
          //       ),
          //     );
          //   },
          // ),
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
          //         builder: (context) => const TrainerDispute(),
          //       ),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.verified),
          //   title: Text(
          //     'Verification',
          //     style: GoogleFonts.merriweather(
          //       fontSize: width * 0.035,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const TrainerVerification(),
          //       ),
          //     );
          //   },
          // ),
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
