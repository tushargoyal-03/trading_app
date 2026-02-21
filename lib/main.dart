import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trading_app/Application_layer/utils/share_preferences.dart';
import 'package:trading_app/Presentation_layer/screens/welcome_screens/first_screen.dart';



SpUtil? sp;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sp = await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trading app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FirstScreen(),
    );
  }
}
