import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/providers/akun.provider.dart';

import 'screens/splashscreen/splashscreen.view.dart';

void main() async {
  // Add this line
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AkunProvider>(
          create: (BuildContext context) => AkunProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(414, 736),
        builder: (context, child) {
          return GetMaterialApp(
            enableLog: !kReleaseMode,
            theme: ThemeData(
              primaryColor: UColors.primary,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: UColors.primaryMaterial,
                backgroundColor: UColors.white,
              ),
              scaffoldBackgroundColor: UColors.white,
              textTheme: GoogleFonts.nunitoTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            defaultTransition: Transition.cupertino,
            title: 'Gitar',
            home: SplashscreenView(),
            // home: VTransactionResult(vm: VMTransaksi()),
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.light,
                  statusBarColor: UColors.primary,
                  systemNavigationBarColor: UColors.primary,
                ),
                child: MediaQuery(
                  data: data.copyWith(
                    textScaleFactor: data.textScaleFactor > 2.0 ? 2.0 : 1.0,
                  ),
                  child: child ?? Container(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
