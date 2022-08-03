import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_by_roger_li/const/AppConst.dart';
import 'package:task_by_roger_li/views/pages/SplashPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  runApp(MyApp());
}

initFirebase() async {
  await Firebase.initializeApp(
    name: 'taskbyroger',
    options: FirebaseOptions(
      apiKey: AppConst.firebase_apiKey,
      appId: AppConst.firebase_appId,
      messagingSenderId: AppConst.firebase_messagingSenderId,
      projectId: AppConst.firebase_projectId,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      title: "RogerTask",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
