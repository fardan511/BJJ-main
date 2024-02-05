// ignore_for_file: use_build_context_synchronously

import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:bjj/trainer/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'input_fields.dart';

class StudentEditProfile extends StatefulWidget {
  const StudentEditProfile({Key? key}) : super(key: key);

  @override
  State<StudentEditProfile> createState() => _StudentEditProfileState();
}

class _StudentEditProfileState extends State<StudentEditProfile> {
  // late String valueChoose;
  final _usernameController = TextEditingController();
  final _profileNameController = TextEditingController();
  final _profileTitleController = TextEditingController();
  final _hourlyRateController = TextEditingController();
  final _bioController = TextEditingController();
  final _livingController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _facebookController = TextEditingController();
  final _twitterController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _instagramController = TextEditingController();
  final _otherLinkController = TextEditingController();

  String? chosenGender, chosenLevel, chosenLocation, chosenNoOfYears;
  List<String> gender = ['Male', 'Female'];
  List<String> coachLevel = ['Coach Level', 'BJJ Black Belt'];
  List<String> location = ['Australia', 'Germany', 'India', 'UAE', 'USA'];
  List<String> noOfYyears = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
  ];

  void saveProfile() async {
    Map<String, String> profileData = {};

    if (_usernameController.text.trim().isNotEmpty) {
      profileData
          .addEntries({"username": _usernameController.text.trim()}.entries);
    }
    if (_profileNameController.text.trim().isNotEmpty) {
      profileData.addEntries(
          {"profileName": _profileNameController.text.trim()}.entries);
    }
    if (_profileTitleController.text.trim().isNotEmpty) {
      profileData.addEntries(
          {"profileTitle": _profileTitleController.text.trim()}.entries);
    }
    if (_hourlyRateController.text.trim().isNotEmpty) {
      profileData.addEntries(
          {"hourlyRate": _hourlyRateController.text.trim()}.entries);
    }
    if (_bioController.text.trim().isNotEmpty) {
      profileData
          .addEntries({"bioDescription": _bioController.text.trim()}.entries);
    }
    if (_livingController.text.trim().isNotEmpty) {
      profileData
          .addEntries({"livingTown": _livingController.text.trim()}.entries);
    }
    if (_facebookController.text.trim().isNotEmpty) {
      profileData.addEntries({
        "facebookURL": _facebookController.text.trim().toLowerCase()
      }.entries);
    }
    if (_instagramController.text.trim().isNotEmpty) {
      profileData.addEntries({
        "instagramURL": _instagramController.text.trim().toLowerCase()
      }.entries);
    }
    if (_twitterController.text.trim().isNotEmpty) {
      profileData.addEntries(
          {"twitterURL": _twitterController.text.trim().toLowerCase()}.entries);
    }
    if (_linkedinController.text.trim().isNotEmpty) {
      profileData.addEntries({
        "linkedinURL": _linkedinController.text.trim().toLowerCase()
      }.entries);
    }
    if (_otherLinkController.text.trim().isNotEmpty) {
      profileData.addEntries({
        "otherLinkURL": _otherLinkController.text.trim().toLowerCase()
      }.entries);
    }
    if (chosenGender != null) {
      profileData.addEntries({"gender": chosenGender!}.entries);
    }
    if (chosenLevel != null) {
      profileData.addEntries({"level": chosenLevel!}.entries);
    }
    if (chosenLocation != null) {
      profileData.addEntries({"location": chosenLocation!}.entries);
    }
    if (chosenNoOfYears != null) {
      profileData.addEntries({"noOfYears": chosenNoOfYears!}.entries);
    }

    // ignore: avoid_print
    print(FirebaseAuth.instance.currentUser!.uid);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(profileData);
  }

  void updatePassword() async {
    final user = FirebaseAuth.instance.currentUser!;

    try {
      if (_currentPasswordController.text.isEmpty) return;
      if (_newPasswordController.text.isEmpty) return;
      if (_confirmPasswordController.text.isEmpty) return;

      if (_newPasswordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'New passwords don\'t match',
              style: GoogleFonts.merriweather(color: Colors.white),
            ),
          ),
        );
        return;
      }

      await user.reauthenticateWithCredential(EmailAuthProvider.credential(
          email: user.email!, password: _currentPasswordController.text));

      await FirebaseAuth.instance.currentUser!
          .updatePassword(_newPasswordController.text);

      _currentPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Password updated succesfully',
            style: GoogleFonts.merriweather(color: Colors.white),
          ),
        ),
      );
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Current password is incorrect',
            style: GoogleFonts.merriweather(color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
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
                                    width: width * 0.4,
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
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                      'My Coach Coaches',
                      style: GoogleFonts.merriweather(
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
                            hintText: 'Username',
                            onChanged: (value) {
                              _usernameController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Profile Name',
                            onChanged: (value) {
                              _profileNameController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Profile Title',
                            onChanged: (value) {
                              _profileTitleController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: NumericInputField(
                            hintText: 'Hourly Rate',
                            onChanged: (value) {
                              _hourlyRateController.text = value;
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
                              hintText: "Select Gender",
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
                            value: chosenGender,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  chosenGender = newValue;
                                });
                              }
                            },
                            items: gender.map(
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
                            value: chosenLevel,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  chosenLevel = newValue;
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
                              hintText: "No of Years",
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
                            value: chosenNoOfYears,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  chosenNoOfYears = newValue;
                                });
                              }
                            },
                            items: noOfYyears.map(
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
                              hintText: "Location",
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
                            controller: _bioController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(30, 16, 20, 16),
                              hintText: 'Bio Description',
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 20, 30, 10),
                          child: Text(
                            'Born, Now living Near (no home addressess please)',
                            style: GoogleFonts.merriweather(
                                fontSize: 0.032 * width),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                            controller: _livingController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(30, 16, 20, 16),
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
                        SizedBox(
                          width: width * 0.7,
                          child: Row(
                            children: [
                              Text(
                                'Certifications,\nSkills,\nAcheivements',
                                style: GoogleFonts.merriweather(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04),
                              ),
                              const Spacer(),
                              Container(
                                width: 120,
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
                                    '+ Add',
                                    style: GoogleFonts.merriweather(
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
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Facebook',
                            onChanged: (value) {
                              _facebookController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Twitter',
                            onChanged: (value) {
                              _twitterController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Linkedin',
                            onChanged: (value) {
                              _linkedinController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Instagram',
                            onChanged: (value) {
                              _instagramController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Other Link',
                            onChanged: (value) {
                              _otherLinkController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.06),
                              child: Container(
                                width: width * 0.4,
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
                                  onPressed: saveProfile,
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Save Profile',
                                    style: GoogleFonts.merriweather(
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
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Current Password',
                            onChanged: (value) {
                              _currentPasswordController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'New Password',
                            onChanged: (value) {
                              _newPasswordController.text = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: InputField(
                            hintText: 'Confirm Password',
                            onChanged: (value) {
                              _confirmPasswordController.text = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          width: width * 0.8,
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
                            onPressed: updatePassword,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: Text(
                              'Change My Password',
                              style: GoogleFonts.merriweather(
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
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  width: width * 0.9,
                  height: height * 0.1,
                  child: Center(
                    child: Container(
                      width: width * 0.8,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
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
                            borderRadius: BorderRadius.circular(3),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Text(
                          'Change My Password',
                          style: GoogleFonts.merriweather(
                            fontSize: 0.032 * width,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
      ),
    );
  }
}
