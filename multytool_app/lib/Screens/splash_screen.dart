import 'package:flutter/material.dart';
import 'package:multytool_app/Screens/onboarding_screen.dart';
import 'package:multytool_app/Widgets/custom_loading.dart';
import 'package:multytool_app/helper/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {

    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Image.asset('assets/Images/logo.png', width: mq.width * .2,),
            ),

            SizedBox(
              height: 10,
            ),

            Text("AI Multi Tools", style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 3, 51, 90)
            ),),

            Text("Chat with chatiee, Generate own Images, Language translator",
              textAlign: TextAlign.center,
             style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: const Color.fromARGB(255, 64, 64, 64)
            ),),

            SizedBox(
              height: 80,
            ),

            CustomLoading(),
          ],
        ),
      ),
      
    );
  }
}