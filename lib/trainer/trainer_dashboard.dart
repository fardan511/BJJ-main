import 'package:bjj/bjj_trainers/trainer_screen_2.dart';
import 'package:bjj/models/trainer_model.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainerDashboard extends StatefulWidget {
  const TrainerDashboard({Key? key}) : super(key: key);

  @override
  State<TrainerDashboard> createState() => _TrainerDashboardState();
}

class _TrainerDashboardState extends State<TrainerDashboard> {
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
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 0.035 * width,
                                //   ),
                                // ),
                                // const SizedBox(
                                //   height: 25,
                                // ),
                                // Text(
                                //   'Student@trainingpros.com',
                                //   style: TextStyle(
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
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${snapshot.data!["userEmail"] ?? snapshot.data!["email"]}',
                                  style: TextStyle(
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
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TrainerScreen2(
                                            trainer: TrainerModel.fromJson(
                                                snapshot.data!.data()!),
                                          ),
                                        ),
                                      );
                                    },
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
                    'Coaches Dashboard',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.045),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(229, 250, 226, 217),
                      Color.fromARGB(205, 239, 211, 201)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                width: width * 0.9,
                height: height * 0.18,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Active Services',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(188, 248, 187, 208),
                      Color.fromARGB(175, 244, 143, 177)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                width: width * 0.9,
                height: height * 0.18,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Ongoing Services',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(250, 242, 233, 194),
                      Color.fromARGB(220, 231, 222, 187),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                width: width * 0.9,
                height: height * 0.18,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Complete Services',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Center(
              //   child: Column(
              //     children: [
              //       Container(
              //         width: 0.9 * MediaQuery.of(context).size.width,
              //         height: 0.5 * MediaQuery.of(context).size.height,
              //         decoration: BoxDecoration(
              //           color: Colors.grey.shade200,
              //           borderRadius: BorderRadius.circular(15),
              //         ),
              //         child: Column(
              //           // mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.all(18.0),
              //               child: Text(
              //                 'Profile Views',
              //                 style: TextStyle(
              //                   fontSize: width * 0.045,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               width: 0.9 * MediaQuery.of(context).size.width,
              //               height: 0.4 * MediaQuery.of(context).size.height,
              //               margin: const EdgeInsets.only(top: 0),
              //               decoration: const BoxDecoration(
              //                 image: DecorationImage(
              //                     image: AssetImage('images/graph.png'),
              //                     fit: BoxFit.cover),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget _buildBox(String text, List<Color> gradientColors) {
//   return Container(
//     margin: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: gradientColors,
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       borderRadius: BorderRadius.circular(15),
//     ),
//     child: Center(
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     ),
//   );
// }
