// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:systemgym/view/screens/public/All%20_employee_screen.dart';
import 'package:systemgym/view/screens/public/add_a_training_screen.dart';
import 'package:systemgym/view/screens/public/add_a_training_section_screen.dart';
import 'package:systemgym/view/screens/public/adding_a_coach_screen.dart';
import 'package:systemgym/view/screens/public/adding_a_diet_screen.dart';
import 'package:systemgym/view/screens/public/adding_a_trainer_screen.dart';
import 'package:systemgym/view/screens/public/adding_an_employee_screen.dart';
import 'package:systemgym/view/screens/public/meal_details_screen.dart';
import 'package:systemgym/view/screens/public/person_daily_program_screen.dart';
import 'package:systemgym/view/screens/public/profile_details_screen.dart';

import 'constants/routes.dart';
import 'test.dart';
import 'view/screens/public/sessions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: VideoPlayerPage(
      //   videoUrl: 'https://youtu.be/YGrtghEmwUI?list=PLbJF4g421wqn7Di5kpxFHh0gXnCJpNoKA',
      // ),
      // Sessions_Screen(),
      // VideoSlider(),
      //  person_daily_program_Screen(),

      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: Routes.adding_an_employee_Screen,
      getPages: AppRoutes.routes,
      // getPages: AppRoutes.routes
    );
  }
}
