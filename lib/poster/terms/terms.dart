import 'package:bjj/poster/about/about.dart';
import 'package:bjj/poster/blogs/blogsDashboard.dart';
import 'package:bjj/poster/coaches/coachesPoster.dart';
import 'package:bjj/poster/contact%20us/contact_us.dart';
import 'package:bjj/poster/privacy/privacy.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(215, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Terms Of Services',
          style: GoogleFonts.merriweather(
            fontSize: width * 0.05,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(212, 47, 0, 0),
                Color.fromARGB(215, 0, 0, 0),
                // Color.fromARGB(215, 0, 0, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: width,
                child: Image.asset(
                  'images/terms.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: height * 0.05),
              Text(
                'Content Pending',
                style: GoogleFonts.merriweather(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left, // Align the text to the left
              ),
              SizedBox(height: height * 0.5),
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.07, 0, width * 0.07, 0),
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      // height: height * 0.2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Center vertically
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.15,
                                height: height * 0.15,
                                child: Image.asset(
                                  'images/logo.png',
                                  width: width * 0.1,
                                  height: height * 0.1,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              SizedBox(width: width * 0.05),
                              Text(
                                'BJJ Training Pros',
                                style: GoogleFonts.merriweather(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: width * 0.15,
                              height: height * 0.065,
                              // height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 96, 22, 15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'images/facebook_round.svg',
                                  color: Colors.white,
                                  width: width * 0.1,
                                  // height: 30,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          InkWell(
                            onTap: () {
                              _launchInstagramURL(
                                  'https://www.instagram.com/bjjtrainingpros/');
                            },
                            child: Container(
                              width: width * 0.15,
                              height: height * 0.065,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 96, 22, 15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'images/instagram.svg',
                                  color: Colors.white,
                                  width: width * 0.08,
                                  // height: 30,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          InkWell(
                            onTap: () {
                              _launchYoutubeURL(
                                  'https://www.youtube.com/@BjjTrainingPros');
                            },
                            child: Container(
                              width: width * 0.15,
                              height: height * 0.065,
                              // height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 96, 22, 15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'images/youtube.svg',
                                  color: Colors.white,
                                  width: width * 0.08,
                                  // height: 30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(width * .01),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AboutScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'About',
                                    style: GoogleFonts.merriweather(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.04),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const BlogsScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Blogs',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.04),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CoachesPoster(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Coaches',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: width * 0.04),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ContactUsScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Contact Us',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.04),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TermsScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Terms',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.04),
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.03),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PrivacyScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Privacy',
                                    style: GoogleFonts.merriweather(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchYoutubeURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> _launchInstagramURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
