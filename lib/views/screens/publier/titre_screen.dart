import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myarticle/views/screens/publier/publier_screen.dart';
import 'package:path_provider/path_provider.dart';
import '../../base/textField/text_field_widget.dart';

class titreScreen extends StatefulWidget {
  const titreScreen({super.key});

  @override
  State<titreScreen> createState() => _titreScreenState();
}

class _titreScreenState extends State<titreScreen> {
  final TextEditingController _controller = TextEditingController();

  File? _image;
  Future getImage(ImageSource source) async{
    final image = await ImagePicker().pickImage(source: source);

    if(image == null) return ;
    final imageTempory = File(image.path);
    setState(() {
      _image = imageTempory;
    });
  }
  /*Future <File> saveFilePermanently(String imagePath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename()
  }*/
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
            child: Icon(Icons.home,color: Colors.white,size: 25,),
          ),
          ),
        ) 
        ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Ajouter l'image",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 1),),
                  const SizedBox(height: 15,),
                  _image != null?Image.file(_image!):Image.asset("assets/svg/undraw_Good_team_re_hrvm.png",height: 200,width: size.width*.8,),
                  const SizedBox(height: 20,),
                 
                  GestureDetector(
                    onTap: ()=> getImage(ImageSource.gallery),
                    child: Container(
                      height: 45,
                      width: size.width,
                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15),boxShadow: const [BoxShadow(color: Colors.grey,spreadRadius: 0.7,blurRadius: 1.7)]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[

                          Text("Gallerie",style:TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300),),
                          SizedBox(width: 15,),
                          Icon(Icons.image,size: 21,color: Colors.white,), 
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: ()=>getImage(ImageSource.camera),
                    child: Container(
                      height: 45,
                      width: size.width,
                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15),boxShadow: const [BoxShadow(color: Colors.grey,spreadRadius: 0.7,blurRadius: 1.7)]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[

                          Text("Camera",style:TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300),),
                          SizedBox(width: 15,),
                          Icon(Icons.camera,size: 21,color: Colors.white,), 
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  const Text("Ajouter le titre",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 1),),
                  const SizedBox(height: 15,),
                  TextInputField(
                    controller: _controller,
                    labelText: "le titre de l'article",
                    
                  ),
                  const SizedBox(height: 80,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const PublicationScreen(titre: "", image: "")));
                    },
                    child: Container(
                      
                      height: 45,
                      width: size.width,
                      decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(15),boxShadow: const [BoxShadow(color: Colors.grey,spreadRadius: 1.1,blurRadius: 0.7)]),
                      child: const Center(child: Text("Continue",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                 
               
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}