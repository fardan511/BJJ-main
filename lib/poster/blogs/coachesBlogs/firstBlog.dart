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

class FirstBlog extends StatefulWidget {
  // ignore: use_super_parameters
  const FirstBlog({Key? key}) : super(key: key);

  @override
  State<FirstBlog> createState() => _FirstBlogState();
}

class _FirstBlogState extends State<FirstBlog> {
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
                      'images/blogCardio.jpeg',
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
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'In the world of Brazilian Jiu-Jitsu (BJJ), cardio is often overlooked as a key component of progression. In this blog article, we will explore the significance of cardio in BJJ and how it can contribute to overall improvement in this martial art.',
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
                            'Topic 1: Understanding the Importance of Cardio in BJJ',
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
                            'When it comes to BJJ, many practitioners focus on strength and technique, often neglecting the role of cardio in their training. However, cardio plays a crucial role in BJJ, as it directly impacts an individual’s endurance, stamina, and overall performance on the mat. Without adequate cardiovascular fitness, BJJ practitioners may find themselves struggling to maintain pace and energy during matches, hindering their ability to execute techniques effectively.',
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
                            'Topic 2: Improving Endurance and Stamina through Cardio Training',
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
                            'Cardiovascular fitness is essential for BJJ practitioners, as matches can be intense and physically demanding. Engaging in regular cardio training, such as running, cycling, or high-intensity interval training (HIIT), can significantly improve endurance and stamina. This, in turn, allows practitioners to sustain energy levels throughout matches and last longer on the mat, giving them a competitive edge over their opponents.',
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
                            'Topic 3: Enhancing Recovery and Injury Prevention with Cardio',
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
                            'In addition to improving endurance and stamina, cardio training can also aid in faster recovery and injury prevention for BJJ practitioners. Engaging in low-impact cardio exercises, such as swimming or using an elliptical machine, can help promote blood circulation and reduce muscle soreness after intense training sessions or matches. Furthermore, maintaining cardiovascular fitness can contribute to overall joint health and flexibility, decreasing the risk of common BJJ-related injuries.',
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
                            'Topic 4: Mental Toughness and Cardiovascular Fitness in BJJ',
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
                            'Beyond the physical benefits, cardio training can also foster mental toughness and resilience in BJJ practitioners. Enduring high-intensity cardio workouts can build mental fortitude, preparing individuals to push through challenging moments during matches and training. The mental discipline developed through cardio training can translate to greater composure and focus on the mat, enabling practitioners to overcome adversity and perform at their best.',
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
                            'Topic 5: Incorporating Cardio into BJJ Training Regimen',
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
                            "To fully harness the benefits of cardio in BJJ, practitioners should incorporate specific cardio exercises into their training regimen. This can include dedicating regular time for cardio workouts, integrating cardio drills during BJJ training sessions, and prioritizing cardiovascular fitness alongside strength and technique training. By embracing cardio as an integral part of their training, BJJ practitioners can elevate their overall performance and progress in this martial art.\n\nThink about it, if you have strength but no cardio, you will most likely tap from pressure, or simply because your gas tank is empty. If you have technique but no cardio how can you expect to keep up especially with the younger studs that have cardio for days! Your technique might be better but he can keep going and his speed seems like its increasing but more likely its you slowing down. Cardio is so under rated in todays brazillion jiu-jitsu. Its a faster game, blue belts are far and away better than 20 or even 10 years ago. Have you ever tapped to pressure? That was more likelya cardio tap. Talk about embarrassing, thats happened to me a couple times and ill never forget it. Another benefit of great cardio is your RHR, your resting heart rate drops, so your heart is working less to pump blood throughout your body. So good cardio is a win,win.\n\nIn conclusion, the role of cardio in BJJ cannot be underestimated. From improving endurance and stamina to enhancing recovery and mental toughness, cardio training offers a plethora of benefits for practitioners. By recognizing the significance of cardiovascular fitness and incorporating it into their training regimen, BJJ practitioners can elevate their game and achieve greater success on the mat. As a seasoned SEO Marketing sales manager, I encourage BJJ enthusiasts to prioritize cardio training as a key component of their progression in this martial art. By doing so, they can unlock their full potential and make significant strides in their BJJ journey.",
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
