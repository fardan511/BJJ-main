import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../trainer_drawer/trainer_drawer.dart';

class TrainerProjectDetails extends StatefulWidget {
  final QueryDocumentSnapshot data;
  const TrainerProjectDetails({
    super.key,
    required this.data,
  });

  @override
  State<TrainerProjectDetails> createState() => _TrainerProjectDetailsState();
}

class _TrainerProjectDetailsState extends State<TrainerProjectDetails> {
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16.0),
                            Text(
                              widget.data['projectTitle'],
                              style: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.03),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/category.svg',
                                        // height: 100,
                                        // width: 100,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Category:\n${widget.data['category']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/level.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Coach Level:\n${widget.data['coachLevel']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/description.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  SizedBox(
                                    width: width * 0.6,
                                    // height: height,
                                    child: Text(
                                      "Description:\n${widget.data['description']}",
                                      style: GoogleFonts.merriweather(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.035),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/english.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "English Level:\n${widget.data['englishLevel']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/yes.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Is Featured:\n${widget.data['isFeatured']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/letter.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Language:\n${widget.data['language']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(182, 178, 223, 219),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/location.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Location:\n${widget.data['location']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/dollar2.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Price:\n${widget.data['price']}\$",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/month.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Project Duration:\n${widget.data['projectDuration']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/controlxpert.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Project Level:\n${widget.data['projectLevel']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/fixed.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(
                                    "Project Type:\n${widget.data['projectType']}",
                                    style: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.06),
                                      child: SvgPicture.asset(
                                        'images/skills.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  SizedBox(
                                    width: width * 0.6,
                                    // height: height,
                                    child: Text(
                                      "Skills:\n${widget.data['skills']}",
                                      style: GoogleFonts.merriweather(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.035),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.05),
                          ],
                        ),
                      ),
                    ),
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
