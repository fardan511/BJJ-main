import 'package:bjj/bjj_trainers/trainer_screen.dart';
import 'package:bjj/core/literals.dart';
import 'package:bjj/models/trainer_model.dart';
import 'package:bjj/poster/about/about.dart';
import 'package:bjj/poster/blogs/blogsDashboard.dart';
import 'package:bjj/poster/coaches/coachesPoster.dart';
import 'package:bjj/poster/contact%20us/contact_us.dart';
import 'package:bjj/poster/privacy/privacy.dart';
import 'package:bjj/poster/terms/terms.dart';
import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

final myitems = [
  Image.asset("images/coach-1.jpg"),
  Image.asset("images/coach-1.jpg"),
  Image.asset("images/coach-2.jpg"),
  Image.asset("images/coach-3.jpg"),
  Image.asset("images/coach-4.jpg"),
];

int activeIndex = 0;

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(215, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BJJ Training Pros',
          style: GoogleFonts.merriweather(
            fontSize: width * 0.05,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const StudentAppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(212, 47, 0, 0),
                Color.fromARGB(215, 0, 0, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              height: 250,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 2),
                              autoPlayInterval: const Duration(seconds: 2),
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                setState(
                                  () {
                                    activeIndex = index;
                                  },
                                );
                              },
                            ),
                            items: myitems,
                          ),
                        ),
                        buildIndicator(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<TrainerModel>>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('role', isEqualTo: 'teacher')
                    .snapshots()
                    .map((event) => event.docs
                        .map((e) => TrainerModel.fromJson(e.data()))
                        .toList()),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox();

                  final trainers = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: trainers.length,
                    itemBuilder: (context, index) {
                      final trainer = trainers[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TrainerScreen(trainer: trainer),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            side: MaterialStateProperty.all(BorderSide.none),
                          ),
                          child: UserCard(
                            name: "${trainer.profileName}",
                            hourlyRate: '\$${trainer.hourlyRate}',
                            starsRating: 4.5,
                            avatarImagePath: trainer.userImage != null &&
                                    trainer.userImage!.isNotEmpty
                                ? trainer.userImage!
                                : AppLiterals.defaultAvatar,
                            country: "${trainer.location}",
                          ),
                        ),
                      );
                    },
                  );
                },
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
                          color: Color.fromARGB(255, 96, 22, 15),
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
                          color: Color.fromARGB(255, 96, 22, 15),
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
                          color: Color.fromARGB(255, 96, 22, 15),
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
                    SizedBox(width: 10),
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
                                  builder: (context) => const AboutScreen(),
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
                                builder: (context) => const CoachesPoster(),
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
                                builder: (context) => const ContactUsScreen(),
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
                                  builder: (context) => const PrivacyScreen(),
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Upload Videos',
      //   backgroundColor: Colors.black,
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const UploadVideos(),
      //       ),
      //     );
      //   },
      //   child: const Icon(Icons.cloud_upload),
      // ),
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

class UserCard extends StatelessWidget {
  final String name;
  final String hourlyRate;
  final double starsRating;
  final String avatarImagePath;
  final String country;

  const UserCard({
    super.key,
    required this.name,
    required this.hourlyRate,
    required this.starsRating,
    required this.avatarImagePath,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: avatarImagePath.isURL
                  ? Image.network(
                      avatarImagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      cacheHeight: 60,
                      cacheWidth: 60,
                    )
                  : Image.asset(
                      avatarImagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Hourly Rate: $hourlyRate'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < starsRating ? Colors.yellow : Colors.grey,
                  size: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle BJJ Trainer button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value for the desired roundness
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.white, // Icon color
                      ),
                      SizedBox(width: 8),
                      Text(
                        'BJJ Trainer',
                        style: GoogleFonts.merriweather(
                          color: Colors.white,
                        ), // Text color
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle USA button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        country,
                        style: GoogleFonts.merriweather(
                          color: Colors.white,
                        ), // Text color
                      ),
                    ],
                  ),
                ),
              ],
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
