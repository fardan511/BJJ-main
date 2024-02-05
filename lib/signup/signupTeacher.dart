// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';
import 'package:bjj/Widgets/global_var.dart';
import 'package:bjj/login/login_page.dart';
import 'package:bjj/signup/rounded_input_field.dart';
import 'package:bjj/student/student_dashboard/student_dashboard.dart';
import 'package:bjj/trainer/trainer_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../dialogBox/error_dialog.dart';

class TeacherSignUpPage extends StatefulWidget {
  const TeacherSignUpPage({super.key});

  @override
  State<TeacherSignUpPage> createState() => _TeacherSignUpPageState();
}

class _TeacherSignUpPageState extends State<TeacherSignUpPage> {
  String userPhotoUrl = '';
  File? _image;
  bool isTeacherloading = false;

  final signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
          _image = File(croppedImage.path);
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
                      padding: EdgeInsets.all(6.0),
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
                    ),
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
                      padding: EdgeInsets.all(6.0),
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
    final isValid = signUpFormKey.currentState!.validate();
    if (isValid) {
      if (_image == null) {
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
        isTeacherloading = true;
      });

      try {
        final data = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim().toLowerCase(),
          password: _passwordController.text.trim(),
        );

        final User user = data.user!;
        uid = user.uid;

        if (_image != null) {
          final ref = FirebaseStorage.instance
              .ref()
              .child('userImages')
              .child('${user.uid}.jpg');
          await ref.putFile(_image!);
          userPhotoUrl = await ref.getDownloadURL();
        }

        GetStorage().write('user_role', 'teacher');

        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          {
            'userName': _nameController.text.trim(),
            'id': user.uid,
            'userEmail': _emailController.text.trim(),
            'userImage': userPhotoUrl,
            'time': DateTime.now(),
            'status': 'approved',
            'role': 'teacher',
          },
        );

        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const TrainerDashboard(),
          ),
          (route) => false,
        );
      } catch (error) {
        if (error is FirebaseAuthException &&
            error.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'The email is already in use. Please use a different email.',
                style: GoogleFonts.merriweather(),
              ),
            ),
          );
        } else {
          print(error);
          ErrorAlertDialog(
            message: error.toString(),
          );
        }
      } finally {
        setState(
          () {
            isTeacherloading = false;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(215, 0, 0, 0),
        body: SingleChildScrollView(
          // Wrap Column with SingleChildScrollView
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Container(
                  width: width * 0.40,
                  height: height * 0.18,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Trainer account",
                      style: GoogleFonts.merriweather(
                        fontSize: 0.05 * width,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(235, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Form(
                      key: signUpFormKey,
                      child: Column(
                        children: [
                          Center(
                            child: InkWell(
                              onTap: () {
                                _showImageDialog();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  borderRadius: BorderRadius.circular(200),
                                ),
                                child: CircleAvatar(
                                  radius: width * 0.10,
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  backgroundImage: _image == null
                                      ? null
                                      : FileImage(_image!),
                                  child: _image == null
                                      ? Transform.scale(
                                          scale:
                                              2, // Adjust the scale factor as needed
                                          child: const Icon(
                                            Icons.camera_enhance,
                                            color: Colors.red,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    RoundedInputField(
                      hintText: 'Name',
                      icon: Icons.person,
                      onChanged: (value) {
                        _nameController.text = value;
                      },
                    ),
                    RoundedInputField(
                      hintText: 'Email',
                      icon: Icons.email,
                      onChanged: (value) {
                        _emailController.text = value;
                      },
                    ),
                    RoundedInputField(
                      hintText: 'Password',
                      icon: Icons.fingerprint_rounded,
                      onChanged: (value) {
                        _passwordController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(238, 209, 14, 14),
                              Color.fromARGB(217, 248, 3, 3),
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
                            if (_nameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Name cannot be empty',
                                    style: GoogleFonts.merriweather(),
                                  ),
                                ),
                              );
                            } else if (_emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Email cannot be empty',
                                    style: GoogleFonts.merriweather(),
                                  ),
                                ),
                              );
                            } else if (_passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Password cannot be empty',
                                    style: GoogleFonts.merriweather(),
                                  ),
                                ),
                              );
                            } else {
                              submitFormOnSignUp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Colors
                                .transparent, // Make the ElevatedButton transparent
                            elevation: 0, // Remove the default elevation
                          ),
                          child: isTeacherloading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'SignUp',
                                  style: GoogleFonts.merriweather(
                                    fontSize: 0.04 * width,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account ",
                            style: GoogleFonts.merriweather(
                                fontSize: 0.042 * width,
                                color: const Color.fromARGB(235, 255, 255, 255),
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: GoogleFonts.merriweather(
                                  fontSize: 0.043 * width,
                                  color:
                                      const Color.fromARGB(235, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
