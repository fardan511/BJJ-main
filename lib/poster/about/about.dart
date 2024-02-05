import 'package:bjj/poster/blogs/blogsDashboard.dart';
import 'package:bjj/poster/coaches/coachesPoster.dart';
import 'package:bjj/poster/contact%20us/contact_us.dart';
import 'package:bjj/poster/privacy/privacy.dart';
import 'package:bjj/poster/terms/terms.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

final myitems = [
  Image.asset("images/about1.jpg"),
  Image.asset("images/about2.jpg"),
  Image.asset("images/about3.jpg"),
  Image.asset("images/about4.jpg"),
  Image.asset("images/about5.jpg"),
  Image.asset("images/about6.jpg"),
];

int activeIndex = 0;

class AboutScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          'About Us',
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
                    'images/about.jpeg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              height: height * 0.44,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 2),
                              autoPlayInterval: const Duration(seconds: 3),
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                            ),
                            items: myitems.map((Widget item) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 5.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: item,
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          buildIndicator(),
                          SizedBox(height: height * 0.03),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.07, 0, width * 0.07, 0),
                  child: RichText(
                    // textAlign: TextAlign.justify,
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'BJJ Training Pros',
                          style: GoogleFonts.merriweather(
                            color: Colors.red, // Set the color to red
                            fontSize: width * 0.04,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' is  the ultimate virtual personal coaching platform for BJJ Students of All Belt Levels and Achivements!',
                          style: GoogleFonts.merriweather(
                            color: Colors.white,
                            fontSize: width * 0.04,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text:
                              '\n\nMeet our World-Class Coaches that are ready to review your videos, critique your techniques, and provide game-changing solutions to level up your game. We’re the final component in increasing your skills in taking your BJJ journey to the next level. ',
                          style: GoogleFonts.merriweather(
                            color: Colors.white,
                            fontSize: width * 0.04,
                            height: 1.5,
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
                  child: RichText(
                    // textAlign: TextAlign.justify,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Find Your Coach',
                          style: GoogleFonts.merriweather(
                              color: Colors.white, // Set the color to red
                              fontSize: width * 0.05,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.07, 0, width * 0.07, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red,
                            size: width * 0.05,
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Text(
                            'Your Dashboard',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red,
                            size: width * 0.05,
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Text(
                            'Coach Messaging',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red,
                            size: width * 0.05,
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Text(
                            'No Hidden Fees',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red,
                            size: width * 0.05,
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Text(
                            'Coach Profiles',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red,
                            size: width * 0.05,
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Text(
                            'Learn More F.A.Q.',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red,
                            size: width * 0.05,
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Text(
                            'Online Support Team',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
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

Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: myitems.length,
      effect: SlideEffect(
        activeDotColor: Colors.red,
        dotColor: Colors.grey.shade400,
        dotHeight: 12,
        dotWidth: 12,
      ),
    );

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
