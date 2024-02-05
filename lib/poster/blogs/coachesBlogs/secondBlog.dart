import 'package:bjj/poster/about/about.dart';
import 'package:bjj/poster/blogs/blogsDashboard.dart';
import 'package:bjj/poster/coaches/coachesPoster.dart';
import 'package:bjj/poster/contact%20us/contact_us.dart';
import 'package:bjj/poster/privacy/privacy.dart';
import 'package:bjj/poster/terms/terms.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondBlog extends StatefulWidget {
  // ignore: use_super_parameters
  const SecondBlog({Key? key}) : super(key: key);

  @override
  State<SecondBlog> createState() => _SecondBlogState();
}

class _SecondBlogState extends State<SecondBlog> {
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
                      'images/blogFlexibility.jpeg',
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
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'As a seasoned Brazillion jiu jitsu practitioner, I have witnessed the importance of flexibility in the world of Brazillion jiu jitsu. In this blog article, I will explore the underrated role of flexibility in Brazilian Jiu-Jitsu (BJJ) and how it can contribute to advancing in the sport while preventing injuries.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'Topic 1: Understanding the Importance of Flexibility in BJJ',
                            style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'Flexibility plays a crucial role in the practice of BJJ. It allows practitioners to execute techniques with fluidity and efficiency. Without flexibility, movements can become restricted, hindering the ability to grapple effectively. In addition, flexibility also contributes to overall body awareness and control, which is essential in maintaining optimal performance and preventing injuries.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'Topic 2: Advancing in BJJ through Flexibility Training',
                            style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'In order to advance in BJJ, practitioners must incorporate flexibility training into their regular practice routine. This can include specific stretching exercises that target the muscles and joints used in BJJ techniques. By improving flexibility, practitioners can enhance their range of motion, making it easier to perform a variety of techniques and maneuvers. This, in turn, can lead to advancements in skill level and overall performance in the sport.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'Topic 3: Preventing Injuries through Flexibility',
                            style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'Flexibility can also play a key role in preventing injuries in BJJ. By improving flexibility, practitioners can reduce the risk of muscle strains, tears, and joint injuries that are common in grappling sports. Stretching and flexibility exercises can help to improve muscle elasticity and joint mobility, making the body more resilient to the demands of BJJ training and competition. Additionally, increased flexibility can contribute to better body alignment and posture, which can further reduce the risk of injury.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'Topic 4: Flexibility as a Complement to Strength and Conditioning',
                            style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'While strength and conditioning are important aspects of BJJ training, flexibility should not be overlooked. In fact, flexibility can complement strength and conditioning by enhancing the body’s ability to move through a full range of motion. This can improve the effectiveness of strength and conditioning exercises, leading to better overall performance in BJJ. By incorporating flexibility training alongside strength and conditioning, practitioners can achieve a more well-rounded approach to their training, ultimately leading to advancements in the sport.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.32, 0),
                          child: Text(
                            'I. Importance of Full Body Stretching',
                            style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'Understanding the importance of full body stretching in BJJ is essential for improved performance and injury prevention. All major muscle groups should be targeted during stretching to ensure balance and flexibility in movements.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.4, 0),
                          child: Text(
                            'II. Legs and Hips                                                                                                                                     '
                            '',
                            style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'The lower body, including the legs and hips, is vital for stability and movement in BJJ. Neglecting to stretch these areas can lead to limited range of motion and susceptibility to strains and sprains.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.32, 0),
                          child: Text(
                            'III. Shoulders and Upper Back                                                                                                                                     '
                            '',
                            style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'The shoulders and upper back play a significant role in BJJ techniques, and proper stretching is essential for mobility and injury prevention in these areas..',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.35, 0),
                          child: Text(
                            'IV. Neck and Spine                                                                                                                                       '
                            '',
                            style: GoogleFonts.merriweather(
                                fontSize: width * 0.035,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'The neck and spine are often overlooked in stretching routines, yet they are crucial for maintaining proper posture and preventing neck and back injuries in BJJ.\n\nIncorporating full body stretching into BJJ training is essential for progression and injury prevention. By addressing all important areas of the body, practitioners can improve their performance and stay healthy in their practice.\n\nIn conclusion, flexibility is truly underrated in how to advance in BJJ and prevent injuries. It plays a vital role in executing techniques with precision, advancing in the sport, and reducing the risk of injury. As practitioners, it is important to prioritize flexibility training alongside other aspects of BJJ training in order to reap the full benefits it has to offer. By understanding and embracing the importance of flexibility, practitioners can elevate their performance and longevity in the sport of Brazilian Jiu-Jitsu.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
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
