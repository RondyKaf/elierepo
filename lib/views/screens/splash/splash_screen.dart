import 'dart:async';

import 'package:flutter/material.dart';
import '../../../base/models/sharepref.dart';
import '../../base/slider/slider_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  PageController controller = PageController();


  _onchanged(int index){
    setState(() {
      currentPage = index;
    });
  }
  
  verificatLogin() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isLogin = preferences.getBool(SharePref.isLogin);
    bool? canShowOnboard = preferences.getBool(SharePref.canShowOnboard);
    if(isLogin != null && isLogin == true && canShowOnboard != null && canShowOnboard == false){
      return Navigator.pushNamedAndRemoveUntil(context, "/accueilscreen", (route) => false);
    }else{
      // ignore: use_build_context_synchronously
      return Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    }
  }

  //liste image splash
  List pages = const[
    SliderWidget(
      title: "simplement un",
      description: "faux texte de l'industrie de l'impression et de la composition. Le Lorem Ipsum est le texte factice standard de l'industrie depuis",
      image: 'assets/gif/premier.gif',
    ),
    SliderWidget(
      title: "simplement un",
      description: "faux texte de l'industrie de l'impression et de la composition. Le Lorem Ipsum est le texte factice standard de l'industrie depuis",
      image: 'assets/gif/man-holding-note.gif',
    ),
    SliderWidget(
      title: "simplement un",
      description: "faux texte de l'industrie de l'impression et de la composition. Le Lorem Ipsum est le texte factice standard de l'industrie depuis",
      image: 'assets/gif/troisieme.gif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: pages.length,
              onPageChanged: _onchanged,
              itemBuilder: (context,index){
            return pages[index];
          }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(pages.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds:300),
                    height: 10,
                    width: (index==currentPage)?30:10,
                    margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index==currentPage)?Colors.blue:Colors.blue.withOpacity(0.5)
                    ),);
                }),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  
                  setState(() {
                    controller.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.easeInQuint);
                    verificatLogin();
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 60,
                  alignment: Alignment.center,
                  width: (currentPage == (pages.length - 1))? 200 : 70,
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(30)),
                  child: (currentPage == (pages.length - 1))? TextButton( onPressed: (){ Navigator.pushNamed(context, '/login');print("ok");},child: const Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),):const Icon(Icons.navigate_next,size: 30,color: Colors.white,),),
                ),
              const SizedBox(height: 20,)

            ],
          )

        ],
      ),
    );
  }
}

/*

Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(pages.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds:300),
                    height: 10,
                    width: (index==currentPage)?30:10,
                    margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index==currentPage)?Colors.blue:Colors.blue.withOpacity(0.5)
                    ),);
                }),
              ),
            
              const SizedBox(height: 40,)
            ],
          )

 */