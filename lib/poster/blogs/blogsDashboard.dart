import 'package:bjj/poster/about/about.dart';
import 'package:bjj/poster/blogs/coachesBlogs/firstBlog.dart';
import 'package:bjj/poster/blogs/coachesBlogs/forthBlog.dart';
import 'package:bjj/poster/blogs/coachesBlogs/secondBlog.dart';
import 'package:bjj/poster/blogs/coachesBlogs/thirdBlog.dart';
import 'package:bjj/poster/coaches/coachesPoster.dart';
import 'package:bjj/poster/contact%20us/contact_us.dart';
import 'package:bjj/poster/privacy/privacy.dart';
import 'package:bjj/poster/terms/terms.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogsScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
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
          'BJJ Blogs',
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
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Container(
                    width: width,
                    child: Image.asset(
                      'images/blog.jpeg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: width,
                    // height: height * 0.1,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.02),
                        SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'images/blogPost1.jpg',
                              width: width * 0.9,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: width * 0.06,
                                color: Colors.grey,
                              ),
                              Text(
                                'by',
                                style: GoogleFonts.merriweather(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add your button action here
                                },
                                child: Text(
                                  'BJJ Training Pros',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.155),
                          child: Row(
                            children: [
                              Icon(
                                Icons.more_rounded,
                                size: width * 0.045,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: width * 0.015,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add your button action here
                                },
                                child: Text(
                                  'Education',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: Text(
                            'How Cardio is Key to Progress in BJJ',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.15, 0, width * 0.15, 0),
                          child: Text(
                            'In the world of Brazilian Jiu-Jitsu (BJJ), cardio is often overlooked as a key component of progression. In this blog article, we will explore the...',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.045,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.3),
                          child: Container(
                            width: width * 0.4,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(159, 246, 207, 210),
                                  Color.fromARGB(159, 242, 209, 212),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FirstBlog(),
                                  ),
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
                                'Read More',
                                style: GoogleFonts.merriweather(
                                  fontSize: 0.04 * width,
                                  color: const Color.fromARGB(255, 202, 40, 28),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: width,
                    // height: height * 0.1,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.02),
                        SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'images/blogPost2.jpg',
                              width: width * 0.9,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: width * 0.06,
                                color: Colors.grey,
                              ),
                              Text(
                                'by',
                                style: GoogleFonts.merriweather(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add your button action here
                                },
                                child: Text(
                                  'BJJ Training Pros',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.155),
                          child: Row(
                            children: [
                              Icon(
                                Icons.more_rounded,
                                size: width * 0.045,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: width * 0.015,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add your button action here
                                },
                                child: Text(
                                  'Education',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: Text(
                            'Why Flexibility is Underrated in How to Advance in BJJ and Prevent Injuries',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.15, 0, width * 0.15, 0),
                          child: Text(
                            'As a seasoned Brazillion jiu jitsu practitioner, I have witnessed the importance of flexibility in the world of Brazillion jiu jitsu. In this blog article,...',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.045,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.3),
                          child: Container(
                            width: width * 0.4,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(159, 246, 207, 210),
                                  Color.fromARGB(159, 242, 209, 212),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SecondBlog(),
                                  ),
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
                                'Read More',
                                style: GoogleFonts.merriweather(
                                  fontSize: 0.04 * width,
                                  color: const Color.fromARGB(255, 202, 40, 28),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: width,
                    // height: height * 0.1,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.02),
                        SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'images/blogPost3.jpg',
                              width: width * 0.9,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: width * 0.06,
                                color: Colors.grey,
                              ),
                              Text(
                                'by',
                                style: GoogleFonts.merriweather(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add your button action here
                                },
                                child: Text(
                                  'BJJ Training Pros',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.155),
                          child: Row(
                            children: [
                              Icon(
                                Icons.more_rounded,
                                size: width * 0.045,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: width * 0.015,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add your button action here
                                },
                                child: Text(
                                  'Education',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.15, 0, width * 0.15, 0),
                          child: Text(
                            'Why Working Out is the Key to Advancing in BJJ',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.15, 0, width * 0.15, 0),
                          child: Text(
                            'In the world of Brazilian Jiu-Jitsu (BJJ), the importance of physical fitness is paramount. In this blog article, we will explore the reasons why working...',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.045,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.3),
                          child: Container(
                            width: width * 0.4,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(159, 246, 207, 210),
                                  Color.fromARGB(159, 242, 209, 212),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ThirdBlog(),
                                  ),
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
                                'Read More',
                                style: GoogleFonts.merriweather(
                                  fontSize: 0.04 * width,
                                  color: const Color.fromARGB(255, 202, 40, 28),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: width,
                    // height: height * 0.1,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.02),
                        SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'images/blogPost4.jpg',
                              width: width * 0.9,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: width * 0.06,
                                color: Colors.grey,
                              ),
                              Text(
                                'by',
                                style: GoogleFonts.merriweather(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add your button action here
                                },
                                child: Text(
                                  'BJJ Training Pros',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.155),
                          child: Row(
                            children: [
                              Icon(
                                Icons.more_rounded,
                                size: width * 0.045,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: width * 0.015,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add your button action here
                                },
                                child: Text(
                                  'Education',
                                  style: GoogleFonts.merriweather(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: Text(
                            'How Your Diet Can Improve BJJ Performance',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.15, 0, width * 0.15, 0),
                          child: Text(
                            'As a dedicated practitioner of Brazilian Jiu Jitsu (BJJ), you understand the physical and mental demands of this martial art. BJJ requires strength, flexibility, endurance,...',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.045,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.3),
                          child: Container(
                            width: width * 0.4,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(159, 246, 207, 210),
                                  Color.fromARGB(159, 242, 209, 212),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ForthBlog(),
                                  ),
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
                                'Read More',
                                style: GoogleFonts.merriweather(
                                  fontSize: 0.04 * width,
                                  color: const Color.fromARGB(255, 202, 40, 28),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding:
                          EdgeInsets.fromLTRB(width * 0.07, 0, width * 0.07, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: width,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Center vertically
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
                                      color:
                                          const Color.fromARGB(255, 96, 22, 15),
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
                                      color:
                                          const Color.fromARGB(255, 96, 22, 15),
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
                                      color:
                                          const Color.fromARGB(255, 96, 22, 15),
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
                                      padding:
                                          EdgeInsets.only(right: width * 0.03),
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
                    ),
                  )
                ],
              ),
            ),
          ],
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
