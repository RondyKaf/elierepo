import 'package:flutter/material.dart';
import 'package:myarticle/utils/constants/constants.dart';

import '../../base/textField/CustomIcon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 1.1,spreadRadius: 0.7)]
            ),
            child: const Center(child: Text("MA",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),))),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Colors.black,))
        ],
      ),
      body: listMenu[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        unselectedItemColor: Colors.blue,
        onTap: (index){
          setState(() {
            pageIndex = index;
          });
        
        },
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search,size:30),label: "Recherche"),
          BottomNavigationBarItem(icon: Center(child: CustomIcon()),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.publish,size:30),label: "Notification "),
          BottomNavigationBarItem(icon: Icon(Icons.person,size:30),label: "Profile"),
        ],
      ),
      );
  }
}