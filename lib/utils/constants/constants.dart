import 'package:flutter/material.dart';
import 'package:myarticle/views/screens/publier/open_screen.dart';
import 'package:myarticle/views/screens/search/search_screen.dart';

import '../../views/profil/profil_screen.dart';
import '../../views/screens/home/accueilScreen.dart';


const List listMenu = [
  AccueilScreen(),
  SearchScreen(),
  OpenScreen(),
  Text("add"),
  ProfileScreen(),
];


showSnakBar(String content,BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content)),
  );
}


