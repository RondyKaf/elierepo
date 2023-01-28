import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/textField/text_field_widget.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [  
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:Colors.white,boxShadow: const [BoxShadow(color: Colors.grey,spreadRadius: 0.4,blurRadius: 0.7)]),
              child: TextInputField(
                controller: controller,
                labelText: "Search",
                  iconPrefix: Icons.search,
                ),
              ),
            ),
            SvgPicture.asset("assets/svg/girl-doing-online-payment.svg")
          ],
        ),
      ),
    );
  }
}