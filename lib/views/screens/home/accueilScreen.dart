import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../base/models/user.dart' as model;

class AccueilScreen extends StatefulWidget {

  const AccueilScreen({super.key});

  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
    String userName = "";
    @override
  void initState() {
    getUserName();
    super.initState();
  }
    void getUserName() async{
      DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

      print(snap.data());
      setState(() {
        userName = (snap.data() as Map<String,dynamic>)['email'];
      });
    }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   // model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Les articles du jour", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 1),),
            const SizedBox(height: 40,),
            SizedBox(
              height: 400,
              width: size.width,
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset("/assets/svg/female-investors.gif",height: 300,width: 250,fit: BoxFit.cover,),
                    ),
                    const Text("Titre de l'article",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                    const Text("is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color.fromARGB(255, 51, 50, 50)),),
                  ],
                );
              }),
            ),
            const SizedBox(height: 40,),
            const Text("les articles recents",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 1),),
            const SizedBox(height: 20,),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      // ignore: sort_child_properties_last
                      child: Image.asset("assets/svg/female-investors.gif",height: 150,width: 150,fit: BoxFit.cover,),
                      borderRadius: BorderRadius.circular(20),
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ));
  }
}