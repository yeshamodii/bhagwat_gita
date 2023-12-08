import 'dart:convert';
import 'package:bhagwat_gita/MainScreen.dart';
import 'package:bhagwat_gita/data/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  Model model=Model(chapter_number: 0, chapter_summary: '', chapter_summary_hindi: '', id: 0, image: '', image_name: '', name: '', name_meaning: '', name_translation: '', name_transliterated: '', verses_count: 0);
   SplashScreen({Key,key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
List<Model> modelList = [];
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Stack(
            children: [
              Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:NetworkImage('https://images-eu.ssl-images-amazon.com/images/I/81YC6O+-qbL._AC_UL900_SR615,900_.jpg'),
                fit: BoxFit.fitHeight
              )
            ),
        ),
              Padding(
                padding: EdgeInsets.only(top: 770,left: 200),
                child: Text('Swipe page>>',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
              )
    ]
          ),
          Stack(
            children: [
              Container(
                color: Color(0xffc09f72),
              )
             , Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 150,left: 10,right: 10),
                  child: Container(
                    child: Text('The Bhagavadgita is an episode recorded in the Mahabharata, a Sanskrit epic poem of ancient India. It is an influential religious text in Hinduism that takes the form of a dialogue between Prince Arjuna and Krishna, an avatar of the Hindu deity Vishnu. It was likely composed in the 1st or 2nd century CE',textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,fontFamily: 'Ab',fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: ElevatedButton(onPressed: ()async{
                    String dataString=
                    await rootBundle.loadString('assets/bhagwat.json');
                    List jsonData=jsonDecode(dataString);
                    modelList=Model.parseList(jsonData);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreen()));
                  }, child: Text('Chapters & Verses')),
                ),
              ],
            ),
    ]
          )
    ]
      )
    );
  }
}
