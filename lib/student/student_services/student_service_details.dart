import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentServiceDetails extends StatefulWidget {
  final QueryDocumentSnapshot data;
  const StudentServiceDetails({
    super.key,
    required this.data,
  });

  @override
  State<StudentServiceDetails> createState() => _StudentServiceDetailsState();
}

class _StudentServiceDetailsState extends State<StudentServiceDetails> {
  String displayText = "";
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: width * 0.15),
          child: Text(
            'Bjj Training Pros',
            style: GoogleFonts.poppins(
              fontSize: 0.042 * width,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: const StudentAppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                width * 0.05,
                width * 0.02,
                width * 0.05,
                width * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.16,
                      height: height * 0.07,
                      child: const Center(
                        child: Icon(
                          Icons.luggage_rounded, // Replace with the desired icon
                          color: Color.fromARGB(187, 0, 0, 0),
                          size: 50,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery Time",
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.data['package']['delivery_time'],
                          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                          // style: TextStyle(
                          //   fontSize: width * 0.04,
                          // ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                width * 0.05,
                width * 0.02,
                width * 0.05,
                width * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(62, 105, 240, 175),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.20,
                      height: height * 0.07,
                      child: const Center(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "A | あ",
                              style: TextStyle(color: Colors.black87, fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "English Level",
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.data['service_level'],
                          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                          // style: TextStyle(
                          //   fontSize: width * 0.04,
                          // ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                width * 0.05,
                width * 0.02,
                width * 0.05,
                width * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.16,
                      height: height * 0.07,
                      child: const Center(
                        child: Icon(
                          Icons.location_on, // Replace with the desired icon
                          color: Color.fromARGB(187, 0, 0, 0),
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.data['service_location'],
                          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                          // style: TextStyle(
                          //   fontSize: width * 0.04,
                          // ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              width: width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Set the border radius
                color: const Color.fromARGB(82, 255, 235, 238),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.15),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '\$${widget.data['package']['price']}.00',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.07,
                            ),
                            contentPadding: EdgeInsets.zero,
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.20),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: widget.data['package']['description'],
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelStyle: TextStyle(
                              fontSize: width * 0.04,
                            ),
                            contentPadding: EdgeInsets.zero,
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.17),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '${widget.data['package']['delivery_time']}',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: const Icon(Icons.access_time),
                            labelStyle: TextStyle(
                              fontSize: width * 0.04,
                            ),
                            contentPadding: EdgeInsets.zero,
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.17),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '1 Video Review',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: widget.data['package']['one_video_review']
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                            labelStyle: TextStyle(
                              fontSize: width * 0.04,
                            ),
                            contentPadding: EdgeInsets.zero,
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.17),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '3 Video Review',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: widget.data['package']['three_video_review']
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                            labelStyle: TextStyle(
                              fontSize: width * 0.04,
                            ),
                            contentPadding: EdgeInsets.zero,
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.17),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '5 Video Review',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: widget.data['package']['five_video_review']
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                            labelStyle: TextStyle(
                              fontSize: width * 0.04,
                            ),
                            contentPadding: EdgeInsets.zero,
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Set the border radius
                color: const Color.fromARGB(82, 255, 235, 238),
              ),
              child: Padding(
                padding: EdgeInsets.all(width * 0.1),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), color: const Color.fromARGB(255, 255, 248, 251)),
                      width: width * 0.9,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.07, width * 0.03, width * 0.07, width * 0.03),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Delivery Time:",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  widget.data['package']['delivery_time'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                Text(
                                  "Category",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                const Spacer(),
                                Text(widget.data['service_category'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ))
                              ],
                            ),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                Text(
                                  "English Level",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  widget.data['service_level'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                Text(
                                  "Location",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  widget.data['service_location'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: width * 0.45,
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
                          'Contact Coach',
                          style: GoogleFonts.poppins(
                            fontSize: 0.032 * width,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
