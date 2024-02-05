// ignore_for_file: unused_import

import 'package:bjj/bjj_trainers/trainer_barbara_pires.dart';
import 'package:bjj/bjj_trainers/trainer_dan_covel.dart';
import 'package:bjj/bjj_trainers/trainer_jamil_hills.dart';
import 'package:bjj/bjj_trainers/trainer_magic_man.dart';
import 'package:bjj/bjj_trainers/trainer_professor_gui.dart';
import 'package:bjj/bjj_trainers/trainer_scott_2.dart';
import 'package:bjj/bjj_trainers/trainer_screen.dart';
import 'package:bjj/poster/about/about.dart';
import 'package:bjj/poster/blogs/blogsDashboard.dart';
import 'package:bjj/poster/blogs/coachesBlogs/firstBlog.dart';
import 'package:bjj/poster/blogs/coachesBlogs/forthBlog.dart';
import 'package:bjj/poster/blogs/coachesBlogs/secondBlog.dart';
import 'package:bjj/poster/blogs/coachesBlogs/thirdBlog.dart';
import 'package:bjj/poster/coaches/coachesPoster.dart';
import 'package:bjj/poster/contact%20us/contact_us.dart';
import 'package:bjj/poster/mission/mission.dart';
import 'package:bjj/poster/privacy/privacy.dart';
import 'package:bjj/poster/terms/terms.dart';
import 'package:bjj/signup/signupStudent.dart';
import 'package:bjj/signup/signupTeacher.dart';
import 'package:bjj/student/student_dashboard/student_dashboard.dart';
import 'package:bjj/firebase_options.dart';
import 'package:bjj/login/login_page.dart';
import 'package:bjj/splash_screen/splash_screen.dart';
import 'package:bjj/student/student_wallet.dart';
import 'package:bjj/student/update_profile/update_student_profile.dart';
import 'package:bjj/trainer/active_gigs/active_gigs.dart';
import 'package:bjj/trainer/trainer_dashboard.dart';
import 'package:bjj/trainer/trainer_dispute.dart';
import 'package:bjj/trainer/trainer_edit_profile.dart';
import 'package:bjj/trainer/trainer_following.dart';
import 'package:bjj/trainer/trainer_gig/trainer_gig.dart';
import 'package:bjj/trainer/trainer_message.dart';
import 'package:bjj/trainer/trainer_project_wishlist.dart';
import 'package:bjj/trainer/trainer_services/create_services.dart';
import 'package:bjj/trainer/trainer_verification.dart';
import 'package:bjj/trainer/trainer_wallet.dart';
import 'package:bjj/trainer/trainer_homescreen/trainer_homescreen.dart';
import 'package:bjj/trainer/update_profile/update_trainer_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
