import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rock_paper_scizors/screen/home/home_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int winS=0;
  int lossS=0;
  int totalS=0;
  int drawS=0;
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Rock Paper Scissors Game',
      home: MyHomePage(title: 'Rock Paper Scissors Game',lossA: lossS,totalA: totalS,winner: winS,drawA: drawS,),
    );
  }
}

