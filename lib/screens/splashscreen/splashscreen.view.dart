import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tugas_crud/screens/login/login.view.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  String appName = '';
  String packageName = '';
  String version = '';
  String buildNumber = '';

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  initPlatformState() async {
    await runTimer();
  }

  runTimer() async {
    var timerDuration = const Duration(seconds: 3);
    return Timer(
      timerDuration,
      () {
        Get.off(() => LoginView());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    ScreenUtil.init(
      context,
      // BoxConstraints(
      //     maxWidth: MediaQuery.of(context).size.width,
      //     maxHeight: MediaQuery.of(context).size.height),
      // orientation: Orientation.portrait,
      designSize: const Size(414, 736),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashscreen.png'),
            fit: BoxFit.fill,
          ),
        ),
        // child: Column(
        //   children: [
        //     Spacer(),
        //     CButton(
        //       onPressed: () => {},
        //       child: Text('Get Started'),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
