import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:bjj/trainer/trainer_gig/trainer_gig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrainerMagicMan extends StatefulWidget {
  // ignore: use_super_parameters
  const TrainerMagicMan({Key? key}) : super(key: key);

  @override
  State<TrainerMagicMan> createState() => _TrainerMagicManState();
}

class _TrainerMagicManState extends State<TrainerMagicMan> {
  bool showTextField1 = false;
  bool showTextField2 = false;
  bool showTextField3 = false;

  void _toggleTextField(int buttonIndex) {
    setState(() {
      showTextField1 = buttonIndex == 1;
      showTextField2 = buttonIndex == 2;
      showTextField3 = buttonIndex == 3;
    });
  }

  String displayText = "";
  // late YoutubePlayerController _controller;
  // final videoURL = "https://youtube.com/watch?v=DP7FUkQhkV4";

  // @override
  // void initState() {
  //   final videoID = YoutubePlayer.convertUrlToId(videoURL);
  //   _controller = YoutubePlayerController(
  //       initialVideoId: videoID!,
  //       flags: const YoutubePlayerFlags(autoPlay: false));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: width * 0.15),
          child: Text(
            'Bjj Training Pros',
            style: GoogleFonts.poppins(
              fontSize: 0.042 * width,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: const StudentAppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // First image
                          Positioned(
                            child: Image.asset(
                              'images/Dan-Covel-Profile-Top.jpeg',
                              width: width,

                              fit: BoxFit.cover, // or BoxFit.contain, depending on your preference
                            ),
                          ),
                          // Second image
                          Positioned(
                              top: 20.0,
                              child: SizedBox(
                                width: width * 0.6,
                                height: height * 0.6,
                                child: Image.asset(
                                  'images/magic_man_profile.png',
                                  fit: BoxFit.contain,
                                ),
                              )

                              // Image.asset(
                              //   'images/trainer-shane-hill.jpg',
                              //   width: width * 0.6,
                              //   height: height * 0.6,
                              //   fit: BoxFit.contain,
                              // ),
                              ),
                        ],
                      ),

                      // Image.asset('images/admin.png'),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Magic Man',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 0.045 * width,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.verified,
                            color: Colors.red,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       back: Colors.green,
                      //       width: width * 0.05,
                      //     ),
                      //     const SizedBox(width: 5),
                      //   ],
                      // ),
                      Text(
                        'BJJ Trainer',
                        style: TextStyle(fontSize: 0.035 * width, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Member Since May 2021',
                        style: TextStyle(
                          fontSize: 0.035 * width,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "\$100.00",
                        style: TextStyle(fontSize: 0.040 * width, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Hourly Rate',
                        style: TextStyle(
                          fontSize: 0.035 * width,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        width: width * 0.45,
                        height: height * 0.05,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                '0',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Current Gigs',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        width: width * 0.45,
                        height: height * 0.05,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                '0',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Current Gigs',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(133, 255, 208, 128),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        width: width * 0.45,
                        height: height * 0.05,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                '0',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Current Gigs',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: width * 0.82,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.4,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(159, 255, 205, 210),
                                    Color.fromARGB(159, 255, 205, 210),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Following',
                                  style: GoogleFonts.poppins(
                                      fontSize: 0.038 * width,
                                      color: Color.fromARGB(255, 202, 40, 28),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: width * 0.01,
                            // ),
                            Container(
                              width: width * 0.4,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(159, 255, 205, 210),
                                    Color.fromARGB(159, 255, 205, 210),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Message',
                                  style: GoogleFonts.poppins(
                                      fontSize: 0.038 * width,
                                      color: const Color.fromARGB(255, 202, 40, 28),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.grey, size: 20),
                            Icon(Icons.star, color: Colors.grey, size: 20),
                            Icon(Icons.star, color: Colors.grey, size: 20),
                            Icon(Icons.star, color: Colors.grey, size: 20),
                            Icon(Icons.star, color: Colors.grey, size: 20),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("(0 Ratings)"),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Set the border radius
                  color: const Color.fromARGB(82, 255, 235, 238),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.30,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(159, 255, 205, 210),
                                Color.fromARGB(159, 255, 205, 210),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () => _toggleTextField(1),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: Text(
                              'About Me',
                              style: GoogleFonts.poppins(
                                  fontSize: 0.031 * width,
                                  color: Color.fromARGB(255, 202, 40, 28),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.32,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(159, 255, 205, 210),
                                Color.fromARGB(159, 255, 205, 210),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () => _toggleTextField(2),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: Text(
                              'Active Gigs',
                              style: GoogleFonts.poppins(
                                  fontSize: 0.031 * width,
                                  color: const Color.fromARGB(255, 208, 49, 37),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.28,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(159, 255, 205, 210),
                                Color.fromARGB(159, 255, 205, 210),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () => _toggleTextField(3),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: Text(
                              'Reviews',
                              style: GoogleFonts.poppins(
                                  fontSize: 0.031 * width,
                                  color: const Color.fromARGB(255, 208, 49, 37),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (showTextField1)
                      Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: const Text(
                          '''Malachi “Magic Man” Edmond is a seasoned Brazilian Jiu-Jitsu (BJJ) practitioner with a wealth of experience that spans over 17 years. With an impressive list of achievements under his belt, including gold medals at the European Nationals, Houston Open, and Orlando Open, as well as a silver at the 2021 Worlds, Edmond has proven himself to be a formidable force in the world of BJJ.\n\nCurrently serving as an instructor at the prestigious Lloyd Irvin Martial Arts Academy, Edmond’s expertise and knowledge in the art of BJJ is highly regarded within the community. His dedication and commitment to the sport have earned him the respect and admiration of his peers and students alike.\n\nAs a virtual personal trainer for BJJ, Edmond offers a unique opportunity for individuals to learn from a world-class athlete and instructor from the comfort of their own homes. Through personalized training sessions, Edmond is able to provide invaluable insights and guidance that are tailored to each individual’s skill level and goals.''',
                        ),
                      ),
                    if (showTextField2)
                      Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const TrainerGig(),
                            //   ),
                            // );
                          },
                          child: Container(
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.05),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Magic Man',
                                        style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: Colors.red,
                                        size: width * 0.04, // Set the icon size
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: width * 0.04, // Set the icon size
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Row(
                                    children: [
                                      Text("Delivery:"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "1-3 Days",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        "Video Feedback",
                                        style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'images/tag.svg',
                                                width: width * 0.05, // Set the width of the SVG
                                              ),
                                              const SizedBox(width: 8.0),
                                              Text(
                                                "Video Reviews",
                                                style: TextStyle(
                                                  fontSize: width * 0.04,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(width: width * 0.1),
                                      Container(
                                        width: width * 0.15,
                                        height: height * 0.03,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          color: const Color.fromARGB(133, 248, 187, 208),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "\$100.00",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (showTextField3)
                      Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: const Text(
                          "No Reviews Yet",
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: width * 0.9,
                // height: height * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        'About Me',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 0.06 * width,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.1),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.16,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.male, // Replace with the desired icon
                                  color: Color.fromARGB(187, 0, 0, 0),
                                  size: 50,
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.1),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.16,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.sports_martial_arts_rounded,
                                  color: Color.fromARGB(183, 0, 0, 0),
                                  size: 50,
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Coach Level",
                                  style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "BJJ Black Belt",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.1),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.16,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 252, 244, 173),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.location_on,
                                  color: Color.fromARGB(183, 0, 0, 0),
                                  size: 50,
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location",
                                  style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "USA",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.1),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.16,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "A | あ",
                                  style: TextStyle(color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Language",
                                  style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "English",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.1),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.16,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.align_vertical_bottom,
                                  color: Color.fromARGB(183, 0, 0, 0),
                                  size: 50,
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "English Level",
                                  style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Professional",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: width * 0.8,
                        height: height * 0.1,
                        child: Padding(
                          padding: EdgeInsets.all(width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'images/facebook.svg',
                                  height: 30,
                                  width: 30,
                                  // ignore: deprecated_member_use
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.07,
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'images/linkedin.svg',
                                  height: 30,
                                  width: 30,
                                  // ignore: deprecated_member_use
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.07,
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'images/github.svg',
                                  height: 30,
                                  width: 30,
                                  // ignore: deprecated_member_use
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    // Center(
                    //   child: Text(
                    //     'Certifications, Skills,\n      Acheivements',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 0.05 * width,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
