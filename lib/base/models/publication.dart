import 'dart:typed_data';

class Publier{
  String id;
  String titre;
  String sousTitre;
  String contenu;
  Uint8List image;

  Publier({
    required this.id,
    required this.titre,
    required  this.sousTitre,
    required this.contenu,
    required this.image,
  });

  static Publier fromjson(Map<String,dynamic>json){
    return Publier(id: json["id"], titre: json["titre"], sousTitre: json["sousTitre"], contenu: json["contenu"] ,image: json["image"]);
  }

  Map<String,dynamic> tojson()=>{
    'id':id,
    'titre':titre,
    'sousTitre':sousTitre,
    'contenu':contenu,
    'image':image
  };
}