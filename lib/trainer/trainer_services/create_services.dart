// ignore_for_file: use_build_context_synchronously

import 'package:bjj/student/input_fields.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:bjj/trainer/trainer_services/table/create_gig_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainerCreateServices extends StatefulWidget {
  const TrainerCreateServices({super.key});

  @override
  State<TrainerCreateServices> createState() => _TrainerCreateServicesState();
}

class _TrainerCreateServicesState extends State<TrainerCreateServices> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isFeatured = false;
  final _descriptionController = TextEditingController();
  final _serviceTitleController = TextEditingController();
  final _nameControllers = List.generate(
    3,
    (index) => TextEditingController(),
    growable: false,
  );
  final _descriptionControllers = List.generate(
    3,
    (index) => TextEditingController(),
    growable: false,
  );

  final _deliveryTimes = List.generate(
    3,
    (index) => '',
    growable: false,
  );

  final _revisions = List.generate(
    3,
    (index) => 0,
    growable: false,
  );

  final _oneVideoReviews = List.generate(
    3,
    (index) => false,
    growable: false,
  );

  final _threeVideoReviews = List.generate(
    3,
    (index) => false,
    growable: false,
  );

  final _fiveVideoReviews = List.generate(
    3,
    (index) => false,
    growable: false,
  );

  final _prices = List.generate(
    3,
    (index) => 0,
    growable: false,
  );

  String? chosenCategory, chosenEnglishLevel, chosenLocation, chosenNoOfYears;
  List<String> category = ['15 Minutes 1:1', '30 Minutes 1:1', 'Video Reviews'];
  List<String> englishLevel = [
    'Basic Level',
    'Bilingual',
    'Fluent',
    'Professional',
  ];
  List<String> location = [
    'Antartica',
    'Asia',
    'Europe',
    'North America',
    'Oceania'
  ];

  void createService() async {
    final packages = [];
    for (int i = 0; i < 3; i++) {
      packages.add({
        "package_id": i,
        "name": _nameControllers[i].text.trim(),
        "description": _descriptionControllers[i].text.trim(),
        "delivery_time": _deliveryTimes[i],
        "revisions": _revisions[i],
        "one_video_review": _oneVideoReviews[i],
        "three_video_review": _threeVideoReviews[i],
        "five_video_review": _fiveVideoReviews[i],
        "price": _prices[i],
      });
    }
    await FirebaseFirestore.instance.collection('services').add({
      "title": _serviceTitleController.text.trim(),
      "category": chosenCategory,
      "level": chosenEnglishLevel,
      "location": chosenLocation,
      "description": _descriptionController.text.trim(),
      "packages": packages,
      "user_id": FirebaseAuth.instance.currentUser!.uid,
      "user_name": FirebaseAuth.instance.currentUser!.displayName,
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    'Create a Service',
                    style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.bold, fontSize: width * 0.045),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: width * 0.9,
                // height: height * 0.5,
                child: Form(
                  // key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: width * 0.9,
                        // height: height * 0.5,
                        child: Form(
                          // key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: width * 0.8,
                                child: InputField(
                                  hintText: 'Service Title',
                                  onChanged: (value) {
                                    _serviceTitleController.text = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: height * 0.065,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: const Color.fromARGB(47, 192, 192, 192)
                                  .withOpacity(0.4),
                            ),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(30, 25, 0, 16),
                            hintText: "Select Category",
                            hintStyle: GoogleFonts.merriweather(
                                fontSize: 0.028 * width),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            // suffixIcon: const Icon(Icons.arrow_drop_down),
                          ),
                          value: chosenCategory,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                chosenCategory = newValue;
                              });
                            }
                          },
                          items: category.map(
                            (String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    valueItem,
                                    style: GoogleFonts.merriweather(
                                      fontSize: 0.033 * width,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: height * 0.065,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: const Color.fromARGB(47, 192, 192, 192)
                                  .withOpacity(0.4),
                            ),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(30, 25, 0, 16),
                            hintText: "Level",
                            hintStyle: GoogleFonts.merriweather(
                                fontSize: 0.028 * width),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            // suffixIcon: const Icon(Icons.arrow_drop_down),
                          ),
                          value: chosenEnglishLevel,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                chosenEnglishLevel = newValue;
                              });
                            }
                          },
                          items: englishLevel.map(
                            (String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    valueItem,
                                    style: GoogleFonts.merriweather(
                                      fontSize: 0.033 * width,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: height * 0.065,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: const Color.fromARGB(47, 192, 192, 192)
                                  .withOpacity(0.4),
                            ),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(30, 25, 0, 16),
                            hintText: "Locations",
                            hintStyle: GoogleFonts.merriweather(
                                fontSize: 0.028 * width),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            // suffixIcon: const Icon(Icons.arrow_drop_down),
                          ),
                          value: chosenLocation,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                chosenLocation = newValue;
                              });
                            }
                          },
                          items: location.map(
                            (String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    valueItem,
                                    style: GoogleFonts.merriweather(
                                      fontSize: 0.033 * width,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: const Color.fromARGB(47, 192, 192, 192)
                                  .withOpacity(0.4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(30, 16, 20, 16),
                            hintText: 'Project Description',
                            hintStyle: GoogleFonts.merriweather(
                                fontSize: 0.028 * width),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 246, 246, 246),
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTable(
                        descriptions: _descriptionControllers,
                        names: _nameControllers,
                        deliveryTimes: _deliveryTimes,
                        revisions: _revisions,
                        oneVideoReviews: _oneVideoReviews,
                        threeVideoReviews: _threeVideoReviews,
                        fiveVideoReviews: _fiveVideoReviews,
                        prices: _prices,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      // SizedBox(
                      //   width: width * 0.8,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment
                      //         .start, // Align text to the left
                      //     children: [
                      //       Text(
                      //         'Add Additional\nServices',
                      //         style: GoogleFonts.merriweather(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: width * 0.045,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       Container(
                      //         width: width * 0.60,
                      //         height: height * 0.06,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(30),
                      //           gradient: const LinearGradient(
                      //             colors: [
                      //               Color.fromARGB(162, 209, 14, 14),
                      //               Color.fromARGB(139, 248, 3, 3),
                      //             ],
                      //             begin: Alignment.centerLeft,
                      //             end: Alignment.centerRight,
                      //           ),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: Colors.grey.withOpacity(0.5),
                      //               blurRadius: 5,
                      //               spreadRadius: 2,
                      //               offset: const Offset(0, 3),
                      //             ),
                      //           ],
                      //         ),
                      //         child: ElevatedButton(
                      //           onPressed: () {},
                      //           style: ElevatedButton.styleFrom(
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(30),
                      //             ),
                      //             backgroundColor: Colors.transparent,
                      //             elevation: 0,
                      //           ),
                      //           child: Text(
                      //             '+ Add Extra Services',
                      //             style: GoogleFonts.merriweather(
                      //               fontSize: 0.032 * width,
                      //               fontWeight: FontWeight.bold,
                      //               color: Colors.white,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 40,
                      // ),
                      SizedBox(
                        width: width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the left
                          children: [
                            Text(
                              'FAQ',
                              style: GoogleFonts.merriweather(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.045,
                              ),
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Container(
                            //   width: width * 0.6,
                            //   height: height * 0.06,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     gradient: const LinearGradient(
                            //       colors: [
                            //         Color.fromARGB(162, 209, 14, 14),
                            //         Color.fromARGB(139, 248, 3, 3),
                            //       ],
                            //       begin: Alignment.centerLeft,
                            //       end: Alignment.centerRight,
                            //     ),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.5),
                            //         blurRadius: 5,
                            //         spreadRadius: 2,
                            //         offset: const Offset(0, 3),
                            //       ),
                            //     ],
                            //   ),
                            //   child: ElevatedButton(
                            //     onPressed: () {},
                            //     style: ElevatedButton.styleFrom(
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(30),
                            //       ),
                            //       backgroundColor: Colors.transparent,
                            //       elevation: 0,
                            //     ),
                            //     child: Text(
                            //       '+ Add New FAQ',
                            //       style: GoogleFonts.merriweather(
                            //         fontSize: 0.032 * width,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            SizedBox(
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Text(
                                    'Make the project Featured',
                                    style: GoogleFonts.merriweather(
                                        fontSize: width * 0.035),
                                  ),
                                  Checkbox(
                                    value: isFeatured,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isFeatured = value ?? false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'If this project is approved for featuring will charge you \$20.00',
                              style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: width * 0.50,
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
                                onPressed: createService,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Create Service',
                                  style: GoogleFonts.merriweather(
                                    fontSize: 0.032 * width,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.1,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
