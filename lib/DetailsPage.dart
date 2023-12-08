import 'package:bhagwat_gita/data/Model.dart';
import 'package:bhagwat_gita/data/ProvideoClass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {


  const DetailsPage({super.key, required this.model});
  final Model model;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffecddc5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Center(
                child: Container(
                  height: 50,
                  width: 190,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffbba58f),
                    border: Border.all(
                      color: Colors.grey.shade300
                    ),
                  ),
                  child: Row(
                    children: [
                      Text('Chapter Number:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                      Text(
                        widget.model.chapter_number.toString(),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(height: 15),
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,style: BorderStyle.solid,
                width: 5)
              ),
              child: Image.network(
                widget.model.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 50,),
            Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey.shade300
                    ),
                  ),
                  child:  Column(
                    children: [
                      Text(widget.model.title.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text(widget.model.text.toString())
                    ],
                  ),
                ),
            ),
            SizedBox(height: 15),
            Container(
                height: 50,
                width: 300,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffbba58f),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade500
                ),
                ),
                child: Row(
                  children: [
                    Text('Image Name:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                    Text(widget.model.image_name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                  ],
                )
            ),
            SizedBox(height: 15),
            Container(
                height: 50,
                width: 300,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(                  color: Color(0xffbba58f),

                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade500
                  ),
                ),
                child: Row(
                  children: [
                    Text('Name Meaning:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                    Text(widget.model.name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                  ],
                )
            ),
            SizedBox(height: 15),
            Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration( color: Color(0xffbba58f),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade500
                ),
                ),
              child: Text(widget.model.chapter_summary),
            ),
            SizedBox(height: 15),
            Container(
              height: 250,
              width: 300,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(                  color: Color(0xffbba58f),

                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade500
                ),
              ),
              child: Text(widget.model.chapter_summary_hindi),
           ),
          ],
        ),
      ),
    );
  }
}
