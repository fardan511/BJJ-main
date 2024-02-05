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

class ForthBlog extends StatefulWidget {
  // ignore: use_super_parameters
  const ForthBlog({Key? key}) : super(key: key);

  @override
  State<ForthBlog> createState() => _ForthBlogState();
}

class _ForthBlogState extends State<ForthBlog> {
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
                      'images/blogDiet.jpeg',
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
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'As a dedicated practitioner of Brazilian Jiu Jitsu (BJJ), you understand the physical and mental demands of this martial art. BJJ requires strength, flexibility, endurance, and mental focus to succeed. One often overlooked aspect of improving performance in BJJ is diet. Proper nutrition can significantly impact your ability to perform at your best on the mats. In this blog post, we will explore the benefits of diet in increasing your performance in BJJ.',
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
                            '1. Enhanced Energy Levels                                                                                                                                                                                   '
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
                            'Proper nutrition provides the fuel your body needs to perform at its best. Consuming a diet rich in complex carbohydrates, lean proteins, and healthy fats can help maintain steady energy levels throughout your training sessions. This is especially important in BJJ, where matches can be physically demanding and may last for extended periods of time. By fueling your body with the right foods, you can ensure that you have the energy needed to execute techniques and outlast your opponents.',
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
                            '2. Faster Recovery                                                                                                                                                                                   '
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
                            'BJJ training can be physically taxing, leading to muscle soreness and fatigue. A diet rich in nutrients such as protein and antioxidants can aid in muscle recovery and reduce inflammation. Consuming foods that support muscle repair and reducing inflammation can help you recover faster between training sessions, allowing you to train more frequently and consistently. Additionally, proper nutrition can help prevent injuries by strengthening your bones and muscles. Especially in older athletes, your diet is crucial for recovery.\n\n Think about it, if your body isnt getting the nutrients it needs, it slows recovery making you feel sore longer or lethargic. This can also affect the quality of sleep you get thereby creating a vicious cycle of non-recovery and fatigue.',
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
                            '3. Improved Mental Focus                                                                                                                                                                                   '
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
                            'In BJJ, mental focus is just as important as physical strength. Proper nutrition plays a significant role in cognitive function and mental clarity. Foods rich in omega-3 fatty acids, such as fish and nuts, can support brain health and enhance mental focus. Additionally, staying hydrated by drinking plenty of water can help maintain mental acuity during training and competition. By fueling your body with the right nutrients, you can maintain the mental sharpness needed to strategize and execute techniques effectively.',
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
                            '4. Weight Management                                                                                                                                                                                   '
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
                            'Maintaining a healthy weight is essential for optimal performance in BJJ. Excess body weight can impede agility and endurance, making it more challenging to execute techniques and maintain a competitive edge. A well-balanced diet can help you manage your weight by providing the right combination of nutrients and controlling portion sizes. By maintaining a healthy weight, you can move more efficiently on the mats and reduce the risk of developing weight-related health issues.',
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
                            '5. Overall Health and Longevity                                                                                                                                                                                    '
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
                            "Proper nutrition not only benefits your performance in BJJ but also contributes to your overall health and longevity. Consuming a diet rich in fruits, vegetables, and whole grains can provide essential vitamins, minerals, and antioxidants that support your immune system and reduce the risk of chronic diseases. By prioritizing your nutrition, you can enhance your physical well-being, maintain a high level of fitness, and continue to enjoy the benefits of training in BJJ for years to come.\n\nIn conclusion, the benefits of diet in increasing your performance in BJJ are undeniable. By fueling your body with the right nutrients, you can enhance your energy levels, recover faster, improve mental focus, manage your weight, and maintain overall health and longevity. As a dedicated practitioner of BJJ, incorporating a well-balanced diet into your training regimen can make a significant difference in your performance on the mats. Remember, proper nutrition is a vital component of achieving success in Brazilian Jiu Jitsu.",
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
