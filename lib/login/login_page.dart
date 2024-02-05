import 'package:bjj/forget_password/forget_password.dart';
import 'package:bjj/signup/signupStudent.dart';
import 'package:bjj/signup/signupTeacher.dart';
import 'package:bjj/student/student_dashboard/student_dashboard.dart';
import 'package:bjj/trainer/trainer_homescreen/trainer_homescreen.dart';
import 'package:bjj/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    final trimmedEmail = emailController.text.trim(); // Trim the email
    final password = passwordController.text.toString();
    _auth
        .signInWithEmailAndPassword(
      email: trimmedEmail,
      password: password,
    )
        .then(
      (value) async {
        UtilsLogin().toastMessage(
          value.user!.email.toString(),
        );

        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .get();

        GetStorage().write('user_role', doc['role']);

        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => doc['role'] == 'teacher'
                ? const TrainerHomescreen()
                : const StudentDashboard(),
          ),
          (route) => false,
        );
      },
    ).onError(
      (error, stackTrace) {
        debugPrint(
          error.toString(),
        );
        UtilsInvalidEmailPassword().toastMessage(
          error.toString(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final textScale = MediaQuery.of(context).textScaleFactor;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(215, 0, 0, 0),
        body: SingleChildScrollView(
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
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign into your account",
                      style: GoogleFonts.merriweather(
                        fontSize: 0.05 * width,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(235, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                  offset: const Offset(1, 1),
                                  color:
                                      const Color.fromARGB(255, 243, 244, 245)
                                          .withOpacity(0.4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Email ",
                                  prefixIcon: const Icon(
                                    Icons.email_rounded,
                                    color: Colors.red,
                                  ),
                                  hintStyle: GoogleFonts.merriweather(
                                      fontSize: 0.028 * width,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
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
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                  offset: const Offset(1, 1),
                                  color: Colors.blueGrey.withOpacity(0.4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password ",
                                  prefixIcon: const Icon(
                                    Icons.fingerprint_rounded,
                                    color: Colors.red,
                                  ),
                                  hintStyle: GoogleFonts.merriweather(
                                      fontSize: 0.028 * width,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                            if (emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Email cannot be empty',
                                    style: GoogleFonts.merriweather(),
                                  ),
                                ),
                              );
                            } else if (passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Password cannot be empty',
                                    style: GoogleFonts.merriweather(),
                                  ),
                                ),
                              );
                            } else {
                              login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          child: Text(
                            'Sign in',
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
                      height: 30,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.merriweather(
                                  fontSize: 0.045 * width,
                                  color:
                                      const Color.fromARGB(235, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign
                                  .center, // Center the text horizontally.
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TeacherSignUpPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Create account as ",
                            style: GoogleFonts.merriweather(
                                fontSize: 0.042 * width,
                                color: const Color.fromARGB(235, 255, 255, 255),
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: "Coach",
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
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StudentSignUpPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Create Account as ",
                            style: GoogleFonts.merriweather(
                                fontSize: 0.042 * width,
                                color: const Color.fromARGB(235, 255, 255, 255),
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: "Student",
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
