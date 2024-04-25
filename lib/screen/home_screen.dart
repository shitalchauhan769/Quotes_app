import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/model/category_model.dart';
import 'package:quotes_app/until/globel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool Isgridview=false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(""),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {

                        },
                        child: const Text(
                          "ON",
                          style: TextStyle(color: Colors.black,fontSize:18),
                        )),
                    TextButton(
                        onPressed: () {

                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.black,fontSize: 18),
                        ))
                  ],
                )
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: (const Text(
            "Quotes",
          )),
        ),
        body: GridView.builder(
          itemCount: category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
           return Tile(index);
          },
        )

      ),


    );
  }

  Widget Tile(int index)
  {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage("${category[index].image}"),
              fit: BoxFit.cover),
          color: Colors.red),
      alignment: Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "${category[index].name}",
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
// Expanded(
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: category.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       padding: EdgeInsets.all(10),
//                       margin: EdgeInsets.all(20),
//                       height: 150,
//                       width: 200,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                               image: NetworkImage("${category[index].image}"),
//                               fit: BoxFit.cover),
//                           color: Colors.red),
//                       alignment: Alignment.bottomLeft,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.5),
//                             borderRadius: BorderRadius.circular(5)),
//                         child: Text(
//                           "${category[index].name}",
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
