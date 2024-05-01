import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/until/globel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool Isgrid=true;
  int exit=0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Would you like to continue learning how to use Flutter alerts?",style: TextStyle(fontFamily: 'Sevillan'),),
              actions: [
               SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   TextButton(
                        onPressed: () {

                        },
                        child: const Text(
                          "grid",
                        )),
                    TextButton(
                        onPressed: () {

                        },
                        child: const Text(
                          "ist",
                        )),
                  ],
                )
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: (const Text(
            "Quotes",
          )),
          actions: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Isgrid=!Isgrid;
                  });

                },
                child: const Text(
                  "click",

                )),

          ],
        ),

        body: Isgrid?GridView.builder(
          itemCount: category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
           return Tile(index);
          },
        ): ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Tile(index);
          },
        ),
      ),
    );
  }
  Widget Tile(int index)
  {
    return InkWell(onTap: () {
      List mainList=[
        HappyList,
        MotivationList,
        sadList,
        MorningList,
        SuccessList,
      ];
     Navigator.pushNamed(context, 'quotes',arguments:mainList[index]);
    },
      child: Container(
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

          ),
        ),
      ),
    );
  }
}

