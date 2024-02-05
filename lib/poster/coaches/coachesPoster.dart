import 'package:bjj/poster/about/about.dart';
import 'package:bjj/poster/blogs/blogsDashboard.dart';
import 'package:bjj/poster/contact%20us/contact_us.dart';
import 'package:bjj/poster/privacy/privacy.dart';
import 'package:bjj/poster/terms/terms.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CoachesPoster extends StatefulWidget {
  // ignore: use_super_parameters
  const CoachesPoster({Key? key}) : super(key: key);

  @override
  State<CoachesPoster> createState() => _CoachesPosterState();
}

class _CoachesPosterState extends State<CoachesPoster> {
  bool showTextField1 = false;
  bool showTextField2 = false;
  bool showTextField3 = false;
  bool showTextField4 = false;
  bool showTextField5 = false;
  bool showTextField6 = false;
  bool showTextField7 = false;

  void _toggleTextField(int buttonIndex) {
    setState(() {
      showTextField1 = buttonIndex == 1;
      showTextField2 = buttonIndex == 2;
      showTextField3 = buttonIndex == 3;
      showTextField4 = buttonIndex == 4;
      showTextField5 = buttonIndex == 5;
      showTextField6 = buttonIndex == 6;
      showTextField7 = buttonIndex == 7;
    });
  }

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
          'Coaches',
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
                      'images/coach.jpeg',
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
                          height: height * 0.02,
                        ),
                        Text(
                          'VIRTUAL JIU-JITSU TRAINING',
                          style: GoogleFonts.merriweather(
                            fontSize: width * 0.1,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 125, 1, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          'Welcome to a new \nway of teaching the\nsport we all love!                                                                                                                    '
                          '',
                          style: GoogleFonts.merriweather(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade800),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'We are currently searching for a limited number of highly skilled jiu-jitsu black belts to join our team of coaches for our virtual personal training website.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            ' As a coach, your primary responsibility will be:                                                                                                                        '
                            '',
                            style: GoogleFonts.merriweather(
                              fontStyle: FontStyle.italic,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            '\n1.  Review uploaded student matches.\n\n2.  Provide a comprehensive narrative assessment of their techniques.\n\n3.  Offer valuable critiques and suggestions that will guide students towards improvement in their jiu-jitsu journey.\n\nWe are looking for individuals who are not only WORLD CLASS EXPERTS in jiu-jitsu but also possess the ability to articulate their observations and provide constructive feedback to students. Your expertise and experience as a high-level black belt will be instrumental in shaping and molding individuals to unleash their full potential in the martial art of jiu-jitsu.\n\nBy joining our team, you will have the opportunity to impact the lives of jiu-jitsu enthusiasts worldwide. Your coaching and guidance will not only help individuals improve their technical skills but also supplement your income doing what you love.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'We don’t simply want academy Black Belts we want BJJ pros who bring 3 things to our platform:                                                                                                                      '
                            '',
                            style: GoogleFonts.merriweather(
                              fontStyle: FontStyle.italic,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            '\n1.  World class athletes who have reached the highest levels in our sport.\n\n2.  Athletes who have garnered respect in the BJJ community.\n\n3.  Professionals who will bring STAR POWER to our students.',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.1, 0, width * 0.1, 0),
                          child: Text(
                            'This is an exciting opportunity to be a part of a dynamic team and make a meaningful impact in the lives of others. If you are passionate about jiu-jitsu and have the necessary expertise, we invite you to join us in this fulfilling endeavor.                                                                                                                     '
                            '',
                            style: GoogleFonts.merriweather(
                              fontStyle: FontStyle.italic,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade800,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width * 0.95,
                          child: Image.asset(
                            'images/coachesFAQ.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          // height: height,
                          width: width * 0.95,
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: width * 0.88,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () => _toggleTextField(1),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Who are BJJ Training Pros?',
                                        style: GoogleFonts.merriweather(
                                            fontSize: 0.035 * width,
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.add,
                                        size: width * 0.06,
                                        color: Colors.red.shade900,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (showTextField1)
                                Padding(
                                  padding: EdgeInsets.all(width * 0.05),
                                  child: Text(
                                    "We are guys who love all things BJJ who are passionate about helping those who also love BJJ. We have created this platform to provide an opportunity for BJJ pros to monetize their expertise. We don’t plan on getting rich with this endeavor, but if we can fill a niche in the BJJ community and create a platform for pros to get paid doing what they love, that’s good enough for us.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: width * 0.88,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () => _toggleTextField(2),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  //  => _toggleTextField(1),
                                  child: Row(
                                    children: [
                                      Text(
                                        'What is expected of a coach?',
                                        style: GoogleFonts.merriweather(
                                            fontSize: 0.035 * width,
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.add,
                                        size: width * 0.06,
                                        color: Colors.red.shade900,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (showTextField2)
                                Padding(
                                  padding: EdgeInsets.all(width * 0.05),
                                  child: Text(
                                    "We are simply introducing a side hustle or another way to earn revenue by helping students by doing something different, by providing a FRAME BY FRAME analysis of their game.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: width * 0.88,
                                height: height * 0.08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () => _toggleTextField(3),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  //  => _toggleTextField(1),
                                  child: Row(
                                    children: [
                                      Text(
                                        'What can I put on my Coach \nprofile?',
                                        style: GoogleFonts.merriweather(
                                            fontSize: 0.035 * width,
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.add,
                                        size: width * 0.06,
                                        color: Colors.red.shade900,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (showTextField3)
                                Padding(
                                  padding: EdgeInsets.all(width * 0.05),
                                  child: Text(
                                    "Anything you like, upcoming seminars, all your social media handles, anything that promotes you and highlights your ability and skill. There’s no limit to your profile. Just please stay within our Terms of Service keeping all content family friendly.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: width * 0.88,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () => _toggleTextField(4),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  //  => _toggleTextField(1),
                                  child: Row(
                                    children: [
                                      Text(
                                        'What rate can I charge?',
                                        style: GoogleFonts.merriweather(
                                            fontSize: 0.035 * width,
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.add,
                                        size: width * 0.06,
                                        color: Colors.red.shade900,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (showTextField4)
                                Padding(
                                  padding: EdgeInsets.all(width * 0.05),
                                  child: Text(
                                    "That’s up to you and what you think is a fair market value for your services. If you find yourself getting busy, up your rates.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: width * 0.88,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () => _toggleTextField(5),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  //  => _toggleTextField(1),
                                  child: Row(
                                    children: [
                                      Text(
                                        'What’s the catch?',
                                        style: GoogleFonts.merriweather(
                                            fontSize: 0.035 * width,
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.add,
                                        size: width * 0.06,
                                        color: Colors.red.shade900,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (showTextField5)
                                Padding(
                                  padding: EdgeInsets.all(width * 0.05),
                                  child: Text(
                                    "All we ask is if you are contacted either through your social media channel or in person to do a VIRTUAL TRAINING (VT) session, you direct them to our platform. This will also help with your platform rating on the site and drive more business your way. The higher your score the more students will select you for a VT session.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: width * 0.88,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () => _toggleTextField(6),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  //  => _toggleTextField(1),
                                  child: Row(
                                    children: [
                                      Text(
                                        'What’s the next step?',
                                        style: GoogleFonts.merriweather(
                                            fontSize: 0.035 * width,
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.add,
                                        size: width * 0.06,
                                        color: Colors.red.shade900,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (showTextField6)
                                Padding(
                                  padding: EdgeInsets.all(width * 0.05),
                                  child: Text(
                                    "We send you an agreement and start to build your profile. We will also send you a practice match to get familiar with the process and the coaches tools you will use to review matches.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: width * 0.88,
                                height: height * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () => _toggleTextField(7),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  //  => _toggleTextField(1),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Can I promote BJJ \nTrainingPros on my own to\noffer my coaching to \nprospective students?',
                                        style: GoogleFonts.merriweather(
                                            fontSize: 0.035 * width,
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.add,
                                        size: width * 0.06,
                                        color: Colors.red.shade900,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (showTextField7)
                                Padding(
                                  padding: EdgeInsets.all(width * 0.05),
                                  child: Text(
                                    "ABSOLUTELY! Why wouldn’t you? We ask you to promote yourself on your own social media outlets and we will promote our coaches also through our social media channels. Think about the last time you were invited to an academy and you shared your techniques, helping students work on their game only to leave with some friends and more IG followers.\n\nThe one thing you didn’t leave with was a way to MONETIZE your skills. With our platform you can conveniently offer your services to those students you meet when visiting the academy. Especially with the ones you made a CONNECTION with.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                            ],
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
