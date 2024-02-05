import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCompleteServices extends StatefulWidget {
  const StudentCompleteServices({Key? key}) : super(key: key);

  @override
  State<StudentCompleteServices> createState() => _StudentCompleteServicesState();
}

class _StudentCompleteServicesState extends State<StudentCompleteServices> {
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
                        child: Column(children: [
                          Image.asset('images/admin.png'),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Student',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 0.035 * width,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Student@trainingpros.com',
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
                    'Completed',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.05),
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
                ),
                width: width * 0.9,
                height: height * 0.1,
                child: Center(
                  child: Text(
                    'No result found!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.03),
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