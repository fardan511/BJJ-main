// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:bjj/dialogBox/error_dialog.dart';
import 'package:bjj/student/input_fields.dart';
import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateStudentProfile extends StatefulWidget {
  const UpdateStudentProfile({Key? key}) : super(key: key);

  @override
  State<UpdateStudentProfile> createState() => _UpdateStudentProfileState();
}

class _UpdateStudentProfileState extends State<UpdateStudentProfile> {
  String userPhotoUrl = '';
  File? _uploadStudentImage;
  final updateStudentImage = GlobalKey<FormState>();
  bool isStudentUpdateProfile = false;

  String _name = '';
  String _email = '';
  String _password = '';

  void _getFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    _cropImage(pickedFile!.path);

    Navigator.pop(context);
  }

  void _getFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _cropImage(pickedFile!.path);

    Navigator.pop(context);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);

    if (croppedImage != null) {
      setState(
        () {
          _uploadStudentImage = File(croppedImage.path);
        },
      );
    }
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Please choose an option',
            style: GoogleFonts.merriweather(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _getFromCamera();
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.camera,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Camera",
                      style: GoogleFonts.merriweather(color: Colors.black),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _getFromGallery();
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.image,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Gallery",
                      style: GoogleFonts.merriweather(color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void submitFormOnSignUp() async {
    final isValid = updateStudentImage.currentState!.validate();
    if (isValid) {
      if (_uploadStudentImage == null) {
        showDialog(
          context: context,
          builder: (context) {
            return const ErrorAlertDialog(
              message: 'Please Pick an Image',
            );
          },
        );
        return;
      }
      setState(() {
        isStudentUpdateProfile = true;
      });
    }
  }

  void updateProfile() async {
    if (_uploadStudentImage != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('userImages')
          .child('${FirebaseAuth.instance.currentUser!.uid}.jpg');
      await ref.putFile(_uploadStudentImage!);
      userPhotoUrl = await ref.getDownloadURL();
    }

    final Map<Object, Object?> data = {};

    if (userPhotoUrl.isNotEmpty) {
      data['userImage'] = userPhotoUrl;
    }

    if (_name.isNotEmpty) {
      data['userName'] = _name;
    }

    if (_email.isNotEmpty) {
      await FirebaseAuth.instance.currentUser!
          .updateEmail(_email.toLowerCase().trim());
      data['email'] = _email.toLowerCase().trim();
    }

    if (_password.isNotEmpty) {
      await FirebaseAuth.instance.currentUser!.updatePassword(_password);
    }

    if (data.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(data);
    }

    if (data.keys.length > 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Password updated succesfully',
            style: GoogleFonts.merriweather(color: Colors.white),
          ),
        ),
      );
    } else {
      if (userPhotoUrl.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Your profile picture has been updated succesfully',
              style: GoogleFonts.merriweather(color: Colors.white),
            ),
          ),
        );
      } else if (_name.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Your name has been updated succesfully',
              style: GoogleFonts.merriweather(color: Colors.white),
            ),
          ),
        );
      }
      // else if (_email.isNotEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       backgroundColor: Colors.green,
      //       content: Text(
      //         'Your email has been updated succesfully',
      //         style: GoogleFonts.merriweather(color: Colors.white),
      //       ),
      //     ),
      //   );
      //        }
      else if (_password.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Your password has been updated succesfully',
              style: GoogleFonts.merriweather(color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align children to the left
                          children: [
                            Center(
                              child: InkWell(
                                onTap: () {
                                  _showImageDialog();
                                },
                                child: CircleAvatar(
                                  radius: width * 0.15,
                                  backgroundColor: Colors.grey.shade200,
                                  backgroundImage: _uploadStudentImage == null
                                      ? null
                                      : FileImage(_uploadStudentImage!),
                                  child: _uploadStudentImage == null
                                      ? Transform.scale(
                                          scale: 2,
                                          child: SvgPicture.asset(
                                            'images/gallery.svg',
                                            color: Colors.grey,
                                            width: width * 0.08,
                                            height: width * 0.08,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.01),
                              child: Text(
                                'Name',
                                style: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 0.035 * width,
                                  // textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              child: InputField(
                                hintText: 'Your name here',
                                onChanged: (value) {
                                  _name = value;
                                },
                              ),
                            ),
                            const SizedBox(height: 25),
                            // Padding(
                            //   padding: EdgeInsets.only(left: width * 0.01),
                            //   child: Text(
                            //     'Email',
                            //     style: GoogleFonts.merriweather(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 0.035 * width,
                            //       // textAlign: TextAlign.left,
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // SizedBox(
                            //   width: width * 0.8,
                            //   child: InputField(
                            //     hintText: 'Your Email here',
                            //     onChanged: (value) {
                            //       _email = value;
                            //     },
                            //   ),
                            // ),
                            const SizedBox(height: 25),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.01),
                              child: Text(
                                'Password',
                                style: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 0.035 * width,
                                  // textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              child: InputField(
                                hintText: 'Your Password here',
                                onChanged: (value) {
                                  _password = value;
                                },
                              ),
                            ),
                            const SizedBox(height: 35),
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
                                onPressed: updateProfile,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Update Profile',
                                  style: GoogleFonts.merriweather(
                                    fontSize: 0.032 * width,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                          ],
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
