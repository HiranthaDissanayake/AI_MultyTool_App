import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:multytool_app/Screens/home_screen.dart';
import 'package:multytool_app/helper/global.dart';
import 'package:multytool_app/model/onboard.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final c = PageController();

    final list = [
      Onboard(
        title: 'Ask Me Anything',
        subtitle: 'I can be your friend & you can ask me anything then I will help you !',
        lottie: 'robat2'
        ),

      Onboard(
        title: 'Generate Your Own Images',
        subtitle: 'Give me your promt , then I will give Image',
        lottie: 'robat1'
        ),

      ];

    return Scaffold(
      body: SizedBox(
        width:double.maxFinite,
        child: PageView.builder(
          controller: c,
          itemCount: list.length,
          itemBuilder: (ctx, ind) {

            final isLast = ind == list.length - 1;

            return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
            Lottie.asset('assets/lottie/${list[ind].lottie}.json', height: mq.height* .3),
            
            SizedBox(
              height: 20,
            ),
            
            Text(list[ind].title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 1
            ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(list[ind].subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                
              ),
              ),
            ),

            const Spacer(flex: 1,),

            Wrap(
              spacing: 10,
              children: List.generate(
                2,
                (i)=> Container(
                  width: i == ind ? 23 : 15,
                  height: 12,
                  decoration: BoxDecoration(
                    color: i == ind ? const Color.fromARGB(255, 25, 50, 118) : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                )),
            ),

            const Spacer(flex: 1),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 25, 50, 118),
                shape: const StadiumBorder(),
                elevation: 2,
                minimumSize: Size(mq.width * .4, 50)
                ),
             onPressed: (){
              if(isLast){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomeScreen()));
              }else{
                c.nextPage(duration: Duration(milliseconds: 600), curve: Curves.ease);
              }
             },
             child: Text(isLast ? "Start" : "Next", style: TextStyle(
              fontSize: 18,
              color: Colors.white
             ),),
            ),

            const Spacer(flex: 2,)
          ],
        );
          },)
      ),
    );
  }
}