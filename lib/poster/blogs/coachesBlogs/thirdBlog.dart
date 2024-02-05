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

class ThirdBlog extends StatefulWidget {
  // ignore: use_super_parameters
  const ThirdBlog({Key? key}) : super(key: key);

  @override
  State<ThirdBlog> createState() => _ThirdBlogState();
}

class _ThirdBlogState extends State<ThirdBlog> {
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
                      'images/blogWorking.jpeg',
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
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'In the world of Brazilian Jiu-Jitsu (BJJ), the importance of physical fitness is paramount. In this blog article, we will explore the reasons why working out is the key to advancing in BJJ.',
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
                            'The Importance of Physical Fitness in BJJ                                                                                                            '
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
                            'BJJ is a martial art that places a strong emphasis on grappling and ground fighting. It requires practitioners to have a high level of physical fitness in order to perform at their best. Physical fitness not only enhances performance in BJJ but also reduces the risk of injury. Additionally, being in top physical condition can give practitioners a competitive edge over their opponents.',
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
                            'The Benefits of Strength Training for BJJ                                                                                                           '
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
                            'Strength training is an essential component of any fitness regime for BJJ practitioners. It helps improve muscular endurance and overall strength, which are crucial for executing BJJ techniques effectively. By incorporating strength training into their workout routines, practitioners can enhance their ability to control and manipulate their opponents on the mat.',
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
                            'The Role of Cardiovascular Fitness in BJJ                                                                                                           '
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
                            'Cardiovascular fitness is another key element of physical conditioning for BJJ. This type of training helps improve endurance, allowing practitioners to maintain a high level of performance throughout a match. In BJJ, matches can be physically demanding and may last for extended periods of time. Therefore, having strong cardiovascular fitness is essential for sustaining energy levels and outlasting opponents.',
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
                            'The Importance of Flexibility and Mobility                                                                                                           '
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
                            'Flexibility and mobility are vital for BJJ practitioners to perform the various techniques and maneuvers required in the sport. Maintaining a high level of flexibility and mobility can help reduce the risk of injuries while also improving overall performance. Stretching and mobility exercises should be incorporated into a practitioner’s workout routine to enhance their range of motion and agility on the mat.',
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
                            'The Mental and Emotional Benefits of Exercise for BJJ',
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
                            "In addition to the physical benefits, regular exercise also provides mental and emotional advantages for BJJ practitioners. Physical activity has been shown to reduce stress, improve mood, and boost self-confidence. These benefits can be particularly advantageous in the high-pressure environment of BJJ competitions and training sessions. Furthermore, staying physically active can help practitioners develop discipline, focus, and perseverance, which are essential for success in BJJ.\n\nFinding time to work out can be a challenge. However, committing to just 3 days per week of exercise can have significant benefits for your performance in Brazilian Jiu Jitsu (BJJ). Regular exercise can improve strength, flexibility, and stamina, all of which are essential for success in BJJ. Additionally, working out can also help reduce the risk of injury, improve mental focus, and enhance overall physical and mental well-being. By dedicating even a small amount of time each week to exercise, you can see noticeable improvements in your BJJ performance.\n\nCommitting to just 3 days per week of working out can have a significant impact on your performance in BJJ. Whether it’s strength training, cardio, or flexibility exercises, consistent exercise can lead to improved physical condition, mental focus, and overall well-being. By prioritizing regular exercise, you can enhance your strength, endurance, and resilience on the mat, allowing you to perform at a higher level during BJJ training and competitions. With just a small time investment, you can experience the benefits of working out and see improvements in your BJJ performance.\n\nIn conclusion, the importance of physical fitness cannot be overstated in the world of BJJ. Working out is the key to advancing in BJJ, as it enhances performance, reduces the risk of injury, and provides a competitive edge. Strength training, cardiovascular fitness, flexibility, and mobility are all essential components of a well-rounded workout routine for BJJ practitioners. Additionally, the mental and emotional benefits of exercise further highlight the significance of physical fitness in BJJ. By prioritizing physical conditioning, BJJ practitioners can improve their skills, endurance, and overall well-being, ultimately leading to greater success in the sport.",
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
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
