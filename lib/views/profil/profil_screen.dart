import 'package:flutter/material.dart';
import 'package:myarticle/controller/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;

  void singOutUser() async{
    setState(() {
      isLoading = true;
    });
    String res = await AuthController().singOut();
    if(res == "success"){
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    singOutUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Center(
            child: Stack(
              children: [
                Image.asset("assets/svg/male-avatar.gif",height:150,width: 150,),
                Positioned(
                  bottom: -10,
                  right: -5,
                  child: IconButton(
                  onPressed: (){},icon: const Icon(Icons.camera),
                ))
              ],
            ),
          ),
        ),
        const Center(child: Text("nom user",style: TextStyle(fontSize: 15),)),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(children: const [
            Text("Article publié",style: TextStyle(fontWeight: FontWeight.bold),),
          ],),
        ),
        GestureDetector(onTap: singOutUser,
        child: Container(
          height: 45,width: 120,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: isLoading? const CircularProgressIndicator(color: Colors.blue,) : const Text("Se deconnecter",style: TextStyle(
              fontSize: 17,fontWeight: FontWeight.bold,
            )),
          ),
        ),)
      ],
    );
  }
}