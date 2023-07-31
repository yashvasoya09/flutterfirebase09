import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase09/screen/view/login_screen.dart';
import 'package:flutterfirebase09/screen/view/register_screen.dart';
import 'package:flutterfirebase09/screen/view/addProduct_screen.dart';
import 'package:flutterfirebase09/screen/view/splash_screen.dart';
import 'package:flutterfirebase09/screen/view/updateScreen.dart';
import 'package:flutterfirebase09/screen/view/viewProduct_screen.dart';
import 'package:flutterfirebase09/utils/notification_services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
NotificationServices.notificationservice.initNotification();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        initialRoute: "splash",
        routes: {
          "login":(context) => loginScreen(),
          "splash":(context) => SplashScreen2(),
          "update":(context) => updateProductScreen(),
          "viewproduct":(context) => viewProductScreen(),
          "addproduct":(context) => addProductScreen(),
          "register":(context) => registerScreen(),
        },
      ),
    ),
  );
}
