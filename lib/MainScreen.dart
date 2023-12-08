import 'package:bhagwat_gita/DetailsPage.dart';
import 'package:bhagwat_gita/SplashScreen.dart';
import 'package:bhagwat_gita/data/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
List<Model>bookmark=[];
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffae7c42),
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Text(
          'Chapters of Bhagvad Gita',style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xffc19d70),
        actions: [
          IconButton(onPressed: (){
            _showBookmarks(context);
          }, icon: Icon(Icons.favorite,color: Colors.white,))
        ],
      ),
      body:  AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(30),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: modelList.length,
          itemBuilder: (context, index) {
            Model model = modelList[index];
            bool isBookmarked = bookmark.contains(model);
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 300),
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 2500),
                child: InkWell(
                  onTap: () {
                    print('Tapped on ${model.chapter_number}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(model : model),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xfffaf6eb),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: NetworkImage(model.image)),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                model.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isBookmarked) {
                                      bookmark.remove(model);
                                    } else {
                                      bookmark.add(model);
                                    }
                                  });
                                },
                                icon: Icon(
                                  isBookmarked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isBookmarked ? Colors.red : null,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _showBookmarks(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text('Bookmark Items'),
      content: Column(
        children: [
          for(Model bookmark in bookmark)
            ListTile(
              title: Text(bookmark.name),
            )
        ],
      ),
    );
  });
}
