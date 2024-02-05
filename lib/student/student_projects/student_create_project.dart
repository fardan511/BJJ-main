import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:bjj/trainer/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCreateProject extends StatefulWidget {
  const StudentCreateProject({Key? key}) : super(key: key);

  @override
  State<StudentCreateProject> createState() => _StudentCreateProjectState();
}

class _StudentCreateProjectState extends State<StudentCreateProject> {
  bool isFeatured = false;

  // late String valueChoose;
  String? valueChoose;
  List<String> category = [
    'App Developments',
    ' - Ionic',
    ' - IOS',
    ' - React Native',
    ' - Android',
    'Business'
  ];
  List<String> coachLevel = ['Coach'];
  List<String> projectType = ['Fixed', 'Hourly'];
  List<String> location = ['Australia', 'Germany', 'India', 'UAE', 'USA'];
  List<String> projectLevel = ['Basic Level', 'Expensive', 'Moderate Level'];
  List<String> projectDuration = [
    '1-3 Weeks',
    '1-5 Days',
    'Long Term',
    'Month',
    'Other',
    'Short term',
    'Year'
  ];
  List<String> englishLevel = [
    'Basic Language',
    'Bilingual',
    'Fluent',
    'Native',
    'Prfessional'
  ];

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
                        child: Column(
                          children: [
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
                          ],
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
                    'My Coach Coaches',
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
                          hintText: 'Project Title',
                          onChanged: (value) {
                            // _emailController.text = value;
                          },
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
                            hintText: "Category",
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                          value: valueChoose,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(
                                () {
                                  valueChoose = newValue;
                                },
                              );
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
                                    style: TextStyle(
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
                            hintText: "Coach Level",
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                          value: valueChoose,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                valueChoose = newValue;
                              });
                            }
                          },
                          items: coachLevel.map(
                            (String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(
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
                            hintText: "Project Type",
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                          value: valueChoose,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                valueChoose = newValue;
                              });
                            }
                          },
                          items: projectType.map(
                            (String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(
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
                      SizedBox(
                        width: width * 0.8,
                        child: InputField(
                          hintText: 'Price',
                          onChanged: (value) {
                            // _emailController.text = value;
                          },
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
                          // controller: bioController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(30, 16, 20, 16),
                            hintText: 'Skills',
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                            hintText: "Project Level",
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                          value: valueChoose,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                valueChoose = newValue;
                              });
                            }
                          },
                          items: projectLevel.map(
                            (String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(
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
                            hintText: "Project Duration",
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                          value: valueChoose,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                valueChoose = newValue;
                              });
                            }
                          },
                          items: projectDuration.map(
                            (String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(
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
                            hintText: "English Level",
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                          value: valueChoose,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                valueChoose = newValue;
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
                                    style: TextStyle(
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
                            hintText: "Location",
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                          value: valueChoose,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                valueChoose = newValue;
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
                                    style: TextStyle(
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
                        height: height * 0.06,
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
                          // controller: bioController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(30, 16, 20, 16),
                            hintText: 'Language',
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                      Container(
                        width: width * 0.8,
                        height: height * 0.1,
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
                          // controller: bioController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(30, 16, 20, 16),
                            hintText: 'Description',
                            hintStyle:
                                GoogleFonts.poppins(fontSize: 0.028 * width),
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
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Aligns children to the left
                          children: [
                            Text(
                              'Attachments',
                              style: TextStyle(fontSize: width * 0.05),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              child: InputField(
                                hintText: 'Choose Files',
                                onChanged: (value) {
                                  // Should be open gallery
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Make the project Featured',
                                  style: TextStyle(fontSize: width * 0.04),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'If this project is approved for featuring will charge you \$10.00',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.06),
                            child: Container(
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
                                  'Create Project',
                                  style: GoogleFonts.poppins(
                                    fontSize: 0.032 * width,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
