
import 'package:myarticle/views/screens/publier/open_screen.dart';
import 'package:myarticle/views/screens/search/search_screen.dart';
import 'package:myarticle/views/screens/splash/splash_screen.dart';
import '../../views/profil/profil_screen.dart';
import '../../views/screens/auth/cree_compte.dart';
import '../../views/screens/auth/login.dart';
import '../../views/screens/home/accueilScreen.dart';
import '../../views/screens/home/home_screen.dart';
import '../../views/screens/publier/titre_screen.dart';




class Routes{

  static var listeInitial = {
    '/':(context)=> const SplashScreen(),
    '/home':(context)=> const HomeScreen(),
    '/accueilscreen':(context)=> const AccueilScreen(),
    '/search':(context)=> const SearchScreen(),
    '/open':(context)=> const OpenScreen(),
    '/titre':(context)=> const titreScreen(),
    '/profil':(context)=> const ProfileScreen(),
    '/login':(context)=> const LoginScreen(),
    '/compte':(context)=> const CreeCommpte(),
  };
}