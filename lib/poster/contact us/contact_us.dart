import 'package:bjj/poster/about/about.dart';
import 'package:bjj/poster/blogs/blogsDashboard.dart';
import 'package:bjj/poster/coaches/coachesPoster.dart';
import 'package:bjj/poster/privacy/privacy.dart';
import 'package:bjj/poster/terms/terms.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
          'Contact Us',
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
        child: Center(
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
                    'images/contact.jpeg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(height: height * 0.05),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.25,
                          height: height * 0.05,
                          // height: 50,
                          child: SvgPicture.asset(
                            'images/contactBook.svg',
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Contact Us',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          'office@bjjtrainingpros.com',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.25,
                          height: height * 0.05,
                          // height: 50,
                          child: SvgPicture.asset(
                            'images/contactEmail.svg',
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Support Team',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          'support@bjjtrainingpros.com',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.25,
                          height: height * 0.05,
                          // height: 50,
                          child: SvgPicture.asset(
                            'images/ContactPhone.svg',
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Business Office',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          '+1-555-555-5555',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.25,
                          height: height * 0.05,
                          // height: 50,
                          child: SvgPicture.asset(
                            'images/contactLocation.svg',
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Our Locations',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          'Coaches Remotely Across USA',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.07, 0, width * 0.07, 0),
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
                                        builder: (context) =>
                                            const BlogsScreen(),
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
                                        builder: (context) =>
                                            const TermsScreen(),
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
