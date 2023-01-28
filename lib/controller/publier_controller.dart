import  'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:myarticle/base/models/publication.dart' as model;
import 'package:myarticle/controller/storage_method.dart';



class PublierController{
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addArticle({
    required String titre,required String sousTitre,required String contenu,required Uint8List image
  }) async{
    
    User cred = _auth.currentUser!;
    String res = "some error occurred";
    
    try{
      if(titre.isNotEmpty || sousTitre.isNotEmpty || contenu.isNotEmpty || image != null){
        
        String imageUrl = await StorageMethod().uploadImageToStorage('image_article', image, false);
        model.Publier publier = model.Publier(id: cred.uid,contenu: contenu,titre: titre,sousTitre: sousTitre,image: image);
        _firestore.collection("article").doc(cred.uid).set(publier.tojson());
        res = "success";
      }else{
        res = "error";
      }
    }catch(e){
      print(e);
    }
    return res;
  }
}