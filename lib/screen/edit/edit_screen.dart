import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/screen/model/qoute_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Color Selected = Colors.black;
  bool ColorOn = false;
  bool imageOn = false;
  String imagePart = "assets/image/img1.jpg";
  List imageList = [
    "assets/image/img1.jpg",
    "assets/image/img3.jpg",
    "assets/image/img4.jpg",
    "assets/image/img5.jpg",
    "assets/image/img6.jpg",
    "assets/image/img7.jpg",
    "assets/image/img8.webp"
  ];

  @override
  Widget build(BuildContext context) {
    QuoteModel model = ModalRoute.of(context)!.settings.arguments as QuoteModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("edit"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 350,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(imagePart),
                    fit: BoxFit.cover,
                    height: 350,
                    width: 400,
                  ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         "${model.quotes}",
                         style: TextStyle(color: Selected, fontSize: 20),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       Align(alignment: Alignment.bottomRight,
                         child: Text(
                           "- ${model.name}",
                           style: TextStyle(color: Selected, fontSize: 20),
                         ),
                       ),
                     ],
                   ),
                 )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.text_fields_outlined)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          ColorOn = !ColorOn;
                          imageOn=false;
                        });
                      },
                      icon: Icon(Icons.color_lens_outlined)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          imageOn = !imageOn;
                          ColorOn=false;
                        });
                      },
                      icon: Icon(Icons.image)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.text_format_outlined)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.save)),
                ],
              ),
            ),
            Visibility(
              visible: ColorOn,
              child: Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemCount: Colors.primaries.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Selected = Selected = Colors.primaries[index];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.primaries[index]),
                      ),
                    ),
                  );
                },
              )),
            ),
            Visibility(
              visible: imageOn,
              child: Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        imagePart = imageList[index];
                      });
                    },
                    child: Container(
                      child: Image(
                        image: AssetImage(
                          "${imageList[index]}",
                        ),
                      ),
                    ),
                  );
                },
              )),
            ),
            const Visibility(child: Column(
              children: [
                Text(""),
                Text(""),
                Text(""),
                Text(""),
                Text(""),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
