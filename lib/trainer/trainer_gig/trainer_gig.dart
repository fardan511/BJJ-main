import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainerGig extends StatefulWidget {
  final bool fromTrainer;
  final QueryDocumentSnapshot data;
  const TrainerGig({
    super.key,
    required this.fromTrainer,
    required this.data,
  });

  @override
  State<TrainerGig> createState() => _TrainerGigState();
}

class _TrainerGigState extends State<TrainerGig> {
  bool showTextField1 = false;
  bool showTextField2 = false;
  bool showTextField3 = false;

  void _toggleTextField(int buttonIndex) {
    setState(() {
      showTextField1 = buttonIndex == 1;
      showTextField2 = buttonIndex == 2;
      showTextField3 = buttonIndex == 3;
    });
  }

  String displayText = "";
  bool isFeatured = false;
  bool _purchasing = false;

  Future<void> _purchasePackage(int index) async {
    setState(() {
      _purchasing = true;
    });

    await FirebaseFirestore.instance.collection('service_purchases').add({
      'service_id': widget.data.id,
      'service_category': widget.data['category'],
      'service_description': widget.data['description'],
      'service_level': widget.data['level'],
      'service_location': widget.data['location'],
      'service_title': widget.data['title'],
      'trainer_id': widget.data['user_id'],
      'trainer_name': widget.data['user_name'],
      'package': widget.data['packages'][index],
      'bought_at': Timestamp.now(),
      'user_id': FirebaseAuth.instance.currentUser!.uid,
    });

    setState(() {
      _purchasing = false;
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  'Services offered by Trainer',
                  style: GoogleFonts.merriweather(
                    fontWeight: FontWeight.bold,
                    fontSize: 0.05 * width,
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                          height: height * 0.1,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.06),
                            child: const Icon(
                              Icons
                                  .luggage_rounded, // Replace with the desired icon
                              color: Color.fromARGB(187, 0, 0, 0),
                              size: 50,
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Time",
                              style: GoogleFonts.merriweather(
                                  fontSize: width * 0.04),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.data['packages'].first['delivery_time'],
                              style: GoogleFonts.merriweather(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                              // style: GoogleFonts.merriweather(
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
                          height: height * 0.1,
                          child: Center(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '''A|あ''',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black87, fontSize: 30),
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
                              style: GoogleFonts.merriweather(
                                  fontSize: width * 0.04),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.data['level'] ?? 'Fluent',
                              style: GoogleFonts.merriweather(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                              // style: GoogleFonts.merriweather(
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
                          height: height * 0.1,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.06),
                              child: const Icon(
                                Icons.location_on,
                                color: Color.fromARGB(187, 0, 0, 0),
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: GoogleFonts.merriweather(
                                  fontSize: width * 0.04),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.data['location'] ?? 'English',
                              style: GoogleFonts.merriweather(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                              // style: GoogleFonts.merriweather(
                              //   fontSize: width * 0.04,
                              // ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns children to the left
                    children: [
                      Text(
                        'Packages',
                        style: GoogleFonts.merriweather(
                          fontWeight: FontWeight.bold,
                          fontSize: 0.05 * width,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(120),
                      1: FixedColumnWidth(120),
                      2: FixedColumnWidth(120),
                      3: FixedColumnWidth(120),
                    },
                    children: [
                      TableRow(
                        children: [
                          const TableCell(child: Text('')),
                          Padding(
                            padding: EdgeInsets.all(height * 0.01),
                            child: TableCell(
                                child: Center(
                                    child: Text('Package 0',
                                        style: GoogleFonts.merriweather()))),
                          ),
                          Padding(
                            padding: EdgeInsets.all(height * 0.01),
                            child: TableCell(
                                child: Center(
                                    child: Text('Package 1',
                                        style: GoogleFonts.merriweather()))),
                          ),
                          Padding(
                            padding: EdgeInsets.all(height * 0.01),
                            child: TableCell(
                                child: Center(
                                    child: Text('Package 2',
                                        style: GoogleFonts.merriweather()))),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: height * 0.01),
                                child: Text(
                                  'Name',
                                  style: GoogleFonts.merriweather(),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                widget.data['packages'][0]['name'],
                                style: GoogleFonts.merriweather(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(top: width * 0.01),
                              child: Text(
                                widget.data['packages'][1]['name'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.merriweather(),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(top: width * 0.01),
                              child: Text(
                                widget.data['packages'][2]['name'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.merriweather(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text('Description',
                                  style: GoogleFonts.merriweather()),
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              widget.data['packages'][0]['description'],
                              style: GoogleFonts.merriweather(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              widget.data['packages'][1]['description'],
                              style: GoogleFonts.merriweather(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              widget.data['packages'][2]['description'],
                              style: GoogleFonts.merriweather(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                'Delivery Time',
                                style: GoogleFonts.merriweather(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.02),
                            child: Text(
                                widget.data['packages'][0]['delivery_time'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.merriweather()),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.02),
                            child: Text(
                                widget.data['packages'][1]['delivery_time'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.merriweather()),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.02),
                            child: Text(
                                widget.data['packages'][2]['delivery_time'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.merriweather()),
                          )),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text('Revision',
                                  style: GoogleFonts.merriweather()),
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              widget.data['packages'][0]['revisions']
                                  .toString(),
                              style: GoogleFonts.merriweather(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              widget.data['packages'][1]['revisions']
                                  .toString(),
                              style: GoogleFonts.merriweather(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              widget.data['packages'][2]['revisions']
                                  .toString(),
                              style: GoogleFonts.merriweather(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                '1 Video Review',
                                style: GoogleFonts.merriweather(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                          TableCell(
                            child: widget.data['packages'][0]
                                    ['one_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                          TableCell(
                            child: widget.data['packages'][1]
                                    ['one_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                          TableCell(
                            child: widget.data['packages'][2]
                                    ['one_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              '3 Video Review',
                              style: GoogleFonts.merriweather(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          TableCell(
                            child: widget.data['packages'][0]
                                    ['three_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                          TableCell(
                            child: widget.data['packages'][1]
                                    ['three_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                          TableCell(
                            child: widget.data['packages'][2]
                                    ['three_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              '5 Video Review',
                              style: GoogleFonts.merriweather(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          TableCell(
                            child: widget.data['packages'][0]
                                    ['five_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                          TableCell(
                            child: widget.data['packages'][1]
                                    ['five_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                          TableCell(
                            child: widget.data['packages'][2]
                                    ['five_video_review']
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Center(
                              child: Text('Price',
                                  style: GoogleFonts.merriweather()),
                            ),
                          )),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                "\$${widget.data['packages'][0]['price']}.00",
                                style: GoogleFonts.merriweather(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                "\$${widget.data['packages'][1]['price']}.00",
                                style: GoogleFonts.merriweather(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                "\$${widget.data['packages'][2]['price']}.00",
                                style: GoogleFonts.merriweather(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.only(left: width * 0.05),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment:
                //         CrossAxisAlignment.start, // Aligns children to the left
                //     children: [
                //       Text(
                //         'Add Extra Services',
                //         style: GoogleFonts.merriweather(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 0.06 * width,
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Checkbox(
                //             value: isFeatured,
                //             onChanged: (bool? value) {
                //               setState(() {
                //                 isFeatured = value ?? false;
                //               });
                //             },
                //           ),
                //           Text(
                //             'Additional Services # \$50.00',
                //             style: GoogleFonts.merriweather(fontSize: width * 0.04),
                //           ),
                //         ],
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       Text(
                //         'Coach can add options to the order.',
                //         style: GoogleFonts.merriweather(
                //           fontSize: width * 0.04,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns children to the left
                    children: [
                      Text(
                        'FAQs',
                        style: GoogleFonts.merriweather(
                          fontWeight: FontWeight.bold,
                          fontSize: 0.05 * width,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10.0), // Set the border radius
                    color: const Color.fromARGB(82, 255, 235, 238),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Container(
                            width: width * 0.3,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(159, 255, 205, 210),
                                  Color.fromARGB(159, 255, 205, 210),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () => _toggleTextField(1),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Text(
                                '1 Video\nReview',
                                style: GoogleFonts.merriweather(
                                    fontSize: 0.028 * width,
                                    color:
                                        const Color.fromARGB(255, 202, 40, 28),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(159, 255, 205, 210),
                                  Color.fromARGB(159, 255, 205, 210),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () => _toggleTextField(2),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Text(
                                '2 Video\nReview',
                                style: GoogleFonts.merriweather(
                                    fontSize: 0.028 * width,
                                    color:
                                        const Color.fromARGB(255, 202, 40, 28),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(159, 255, 205, 210),
                                  Color.fromARGB(159, 255, 205, 210),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () => _toggleTextField(3),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Text(
                                '3 Video\nReview',
                                style: GoogleFonts.merriweather(
                                    fontSize: 0.028 * width,
                                    color:
                                        const Color.fromARGB(255, 202, 40, 28),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (showTextField1)
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.15),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText:
                                      '\$${widget.data['packages'][0]['price']}.00',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelStyle: GoogleFonts.merriweather(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05,
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
                                  labelText: widget.data['packages'][0]
                                      ['description'],
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelStyle: GoogleFonts.merriweather(
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
                                  labelText:
                                      '${widget.data['packages'][0]['delivery_time']}',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: const Icon(Icons.access_time),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][0]
                                          ['one_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                            top: height * 0.025,
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][0]
                                          ['three_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][0]
                                          ['five_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ),
                            if (!widget.fromTrainer)
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
                                  onPressed: () {
                                    _purchasePackage(0).then(
                                      (_) => Navigator.of(context).pop(),
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
                                    'Order (\$${widget.data['packages'][0]['price']}.00)',
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
                      if (showTextField2)
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.15),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText:
                                      '\$${widget.data['packages'][1]['price']}.00',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelStyle: GoogleFonts.merriweather(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05,
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
                                  labelText: widget.data['packages'][1]
                                      ['description'],
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelStyle: GoogleFonts.merriweather(
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
                                  labelText:
                                      '${widget.data['packages'][1]['delivery_time']}',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.025),
                                    child: Icon(Icons.access_time),
                                  ),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][1]
                                          ['one_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][1]
                                          ['three_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][1]
                                          ['five_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ),
                            if (!widget.fromTrainer)
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
                                  onPressed: () {
                                    _purchasePackage(1).then(
                                      (_) => Navigator.of(context).pop(),
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
                                    'Order (\$${widget.data['packages'][1]['price']}.00)',
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
                      if (showTextField3)
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.15),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText:
                                      '\$${widget.data['packages'][2]['price']}.00',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelStyle: GoogleFonts.merriweather(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05,
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
                                  labelText: widget.data['packages'][2]
                                      ['description'],
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelStyle: GoogleFonts.merriweather(
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
                                  labelText:
                                      '${widget.data['packages'][2]['delivery_time']}',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.025),
                                    child: const Icon(Icons.access_time),
                                  ),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][2]
                                          ['one_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][2]
                                          ['three_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
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
                                  prefixIcon: widget.data['packages'][2]
                                          ['five_video_review']
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.025),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                  labelStyle: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ),
                            if (!widget.fromTrainer)
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
                                  onPressed: () {
                                    _purchasePackage(2).then(
                                      (_) => Navigator.of(context).pop(),
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
                                    'Order (\$${widget.data['packages'][2]['price']}.00)',
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
                      SizedBox(
                        height: height * 0.05,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10.0), // Set the border radius
                    color: const Color.fromARGB(82, 255, 235, 238),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.1),
                    child: Column(
                      children: [
                        // Container(
                        //   width: width * 0.55,
                        //   height: 50,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(30),
                        //     gradient: const LinearGradient(
                        //       colors: [
                        //         Color.fromARGB(255, 242, 209, 221),
                        //         Color.fromARGB(255, 242, 209, 221),
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
                        //     child: Padding(
                        //       padding: EdgeInsets.fromLTRB(
                        //           width * 0.05, 0, width * 0.05, 0),
                        //       child: Row(
                        //         children: [
                        //           Icon(
                        //             Icons.favorite,
                        //             color: Colors.redAccent,
                        //             size: 0.032 * width, // Set the icon size
                        //           ),
                        //           Text(
                        //             'Wishlist Services',
                        //             style: GoogleFonts.poppins(
                        //               fontSize: 0.032 * width,
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.red,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: h),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromARGB(255, 255, 248, 251)),
                          // width: width * 0.95,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Delivery Time:",
                                    style: GoogleFonts.merriweather(
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "1-2 Weeks",
                                    style: GoogleFonts.merriweather(
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
                                    style: GoogleFonts.merriweather(
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Video Revision",
                                    style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 13),
                              Row(
                                children: [
                                  Text(
                                    "English Level",
                                    style: GoogleFonts.merriweather(
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Fluent",
                                    style: GoogleFonts.merriweather(
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
                                    style: GoogleFonts.merriweather(
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "North America",
                                    style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Container(
                        //   width: width * 0.45,
                        //   height: 50,
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
                        //       'Contact Coach',
                        //       style: GoogleFonts.poppins(
                        //         fontSize: 0.032 * width,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_purchasing)
            Positioned.fill(
              child: Container(
                color: Colors.black87,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 64,
                        height: 64,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        'Processing order',
                        style: GoogleFonts.merriweather(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
