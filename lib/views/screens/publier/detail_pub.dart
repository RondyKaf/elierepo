import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPub extends StatefulWidget {
  const DetailPub({super.key});

  @override
  State<DetailPub> createState() => _DetailPubState();
}

class _DetailPubState extends State<DetailPub> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        leading: GestureDetector(
          onTap:(){
            setState(() {
             Navigator.pop(context);
            });
          },
          child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.only(left: 12,right: 12),
          decoration: const BoxDecoration(color: Colors.blue,shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 1.0,spreadRadius: 0.7)]),
          child: const Center(
            child: Icon(Icons.arrow_back,color: Colors.white,size: 25,),
          ),
          ),
        ) 
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Text("Ajouter l'article",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SvgPicture.asset("assets/svg/girl-doing-online-payment.svg",height: 200,width: 200,),
            const SizedBox(height:20),
            const Text("simplement un faux texte de l'industrie de l'impression et de la composition. Le Lorem Ipsum est le texte factice standard de l'industrie depuis les années 1500",style: TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.center,),
            const SizedBox(height:30),
            Center(
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 45,
                  width: 200,
                  decoration:  BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 0.1,spreadRadius: 0.7)]
                  ),
                  child: const Center(child: Text("Publier",style: TextStyle(color: Colors.white),)),
                ),
              ),
            )
          ]
        ),
      )  
    );
  }
}