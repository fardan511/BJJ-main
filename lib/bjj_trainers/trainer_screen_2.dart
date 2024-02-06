import 'package:bjj/chat/chatterScreen.dart';
import 'package:bjj/models/trainer_model.dart';
import 'package:bjj/student/student_drawer/student_drawer.dart';
import 'package:bjj/trainer/trainer_drawer/trainer_drawer.dart';
import 'package:bjj/trainer/trainer_gig/trainer_gig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/literals.dart';
import 'trainer_projects_screen.dart';

class TrainerScreen2 extends StatefulWidget {
  final TrainerModel trainer;
  const TrainerScreen2({super.key, required this.trainer});

  @override
  State<TrainerScreen2> createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen2> {
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
  late YoutubePlayerController _controller;
  final videoURL = "https://youtube.com/watch?v=DP7FUkQhkV4";
  DateTime? memberSince;

  @override
  void initState() {
    memberSince = widget.trainer.time?.toDate();
    final videoID = widget.trainer.otherLinkURL?.contains('youtube') ?? false
        ? YoutubePlayer.convertUrlToId(widget.trainer.otherLinkURL!)
        : YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(initialVideoId: videoID!, flags: const YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: width * 0.15),
          child: Center(
            child: Text(
              'BJJ Training Pros',
              style: GoogleFonts.merriweather(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: const AppDrawer(),
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
                      SizedBox(
                        height: 360,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // First image
                            Positioned(
                              child: widget.trainer.userImage != null && widget.trainer.userImage!.isNotEmpty
                                  ? Image.asset(
                                      'images/white.png',
                                      width: width,
                                      fit: BoxFit.fitHeight, // or BoxFit.contain, depending on your preference
                                    )
                                  : AspectRatio(
                                      aspectRatio: 9 / 9,
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                            ),
                            // Second image
                            Positioned(
                              top: width * -0.1,
                              child: SizedBox(
                                width: width * 0.55,
                                height: height * 0.55,
                                child: Image.network(
                                  widget.trainer.userImage != null && widget.trainer.userImage!.isNotEmpty
                                      ? widget.trainer.userImage!
                                      : AppLiterals.defaultAvatar,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "${widget.trainer.profileName}",
                              style: GoogleFonts.merriweather(
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
                      Text(
                        "${widget.trainer.level}",
                        style: GoogleFonts.merriweather(fontSize: 0.035 * width, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Member Since: ${memberSince?.day}-${memberSince?.month.toString().padLeft(2, "0")}-${memberSince?.year}",
                        style: GoogleFonts.merriweather(
                          fontSize: 0.035 * width,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "\$${widget.trainer.hourlyRate}",
                        style: GoogleFonts.merriweather(fontSize: 0.040 * width, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Hourly Rate',
                        style: GoogleFonts.merriweather(
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
                                style: GoogleFonts.merriweather(fontWeight: FontWeight.bold, fontSize: width * 0.035),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Current Gigs',
                              style: GoogleFonts.merriweather(fontWeight: FontWeight.bold, fontSize: width * 0.035),
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
                                style: GoogleFonts.merriweather(fontWeight: FontWeight.bold, fontSize: width * 0.035),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Current Gigs',
                              style: GoogleFonts.merriweather(fontWeight: FontWeight.bold, fontSize: width * 0.035),
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
                                style: GoogleFonts.merriweather(fontWeight: FontWeight.bold, fontSize: width * 0.035),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Current Gigs',
                              style: GoogleFonts.merriweather(fontWeight: FontWeight.bold, fontSize: width * 0.035),
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
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => TrainerProjectScreen(trainerId: widget.trainer.id ?? ''),
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
                                  'Projects',
                                  style: GoogleFonts.merriweather(
                                      fontSize: 0.035 * width,
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
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ChatterScreen(
                                        user: widget.trainer,
                                      ),
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
                                  'Message',
                                  style: GoogleFonts.merriweather(
                                      fontSize: 0.035 * width,
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
                // height: height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Set the border radius
                  color: const Color.fromARGB(82, 255, 235, 238),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.29,
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
                            // onPressed: () {
                            //   setState(
                            //     () {
                            //       displayText =
                            //           "Shane Jamil Hill-Taylor, also known as Jamil Hill, is a highly accomplished jiu-jitsu athlete specializing in personal training. With an impressive track record and multiple championship wins, Shane has established himself as one of the top American-born competitors in the sport.\n\nHe has earned three IBJJF World titles as a blue, purple, and brown belt, reflecting his dedication and skill. Known as “Bruxo” among his Brazilian teammates, which means “Wizard” in Portuguese, Shane’s exceptional scrambles and positions have earned him this nickname.\n\nIf you’re looking for a virtual personal BJJ trainer, Shane Jamil Hill-Taylor is the perfect choice to guide and mentor you on your jiu-jitsu journey.";
                            //     },
                            //   );
                            // },

                            child: Text(
                              'About Me',
                              style: GoogleFonts.merriweather(
                                  fontSize: 0.03 * width,
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
                              style: GoogleFonts.merriweather(
                                  fontSize: 0.030 * width,
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
                              style: GoogleFonts.merriweather(
                                  fontSize: 0.030 * width,
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
                        child: Text(
                          widget.trainer.bioDescription ?? 'No description',
                          style: GoogleFonts.merriweather(),
                        ),
                      ),
                    if (showTextField2)
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('services')
                              .where('user_id', isEqualTo: widget.trainer.id)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return const SizedBox();

                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  final data = snapshot.data!.docs[index];
                                  return Padding(
                                    padding: EdgeInsets.all(width * 0.05),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TrainerGig(
                                              data: data,
                                              fromTrainer: false,
                                            ),
                                          ),
                                        );
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
                                                    "${data['user_name']}",
                                                    style: GoogleFonts.merriweather(
                                                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
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
                                              Row(
                                                children: [
                                                  const Text("Delivery:"),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    data['packages'].first['delivery_time'],
                                                    style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    data['title'],
                                                    style: GoogleFonts.merriweather(
                                                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
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
                                                            style: GoogleFonts.merriweather(
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
                                                    child: Center(
                                                      child: Text(
                                                        "\$${data['packages'].first['price']}.00",
                                                        style: GoogleFonts.merriweather(
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
                                  );
                                });
                          }),
                    if (showTextField3)
                      Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Text(
                          "No Reviews Yet",
                          style: GoogleFonts.merriweather(), // Apply the desired font
                        ),
                      ),
                    const SizedBox(height: 20),
                    Center(
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
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
                        style: GoogleFonts.merriweather(
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
                                  style: GoogleFonts.merriweather(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   height: height * 0.01,
                                // ),
                                Text(
                                  "${widget.trainer.gender}",
                                  style: GoogleFonts.merriweather(
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
                                  style: GoogleFonts.merriweather(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${widget.trainer.level}",
                                  style: GoogleFonts.merriweather(
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
                                  style: GoogleFonts.merriweather(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${widget.trainer.location}",
                                  style: GoogleFonts.merriweather(
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
                              child: Center(
                                child: Text(
                                  "A|あ",
                                  style: GoogleFonts.merriweather(color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Language",
                                  style: GoogleFonts.merriweather(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "English",
                                  style: GoogleFonts.merriweather(
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
                                  style: GoogleFonts.merriweather(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Professional",
                                  style: GoogleFonts.merriweather(
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
