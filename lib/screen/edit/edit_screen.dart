// import 'dart:js_interop';
// import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/screen/model/qoute_model.dart';
import 'dart:ui'as ui;

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Color Selected = Colors.black;

  String imagePart = "assets/image/img1.jpg";
  String textstyle = "OpenSana";
  List imageList = [
    "assets/image/img1.jpg",
    "assets/image/img3.jpg",
    "assets/image/img4.jpg",
    "assets/image/img5.jpg",
    "assets/image/img6.jpg",
    "assets/image/img7.jpg",
    "assets/image/img8.webp"
  ];
  List textList = ['RobotoMono', 'Sevillana', 'Montserrat', 'Mukta', 'Nunito'];
  bool ColorOn = false;
  bool imageOn = false;
  bool textOn = false;
  bool boldOn = false;
  bool italicOn = false;
  bool underline = false;
  FontWeight bold = FontWeight.normal;
  FontStyle Style=FontStyle.normal;
  TextDecoration line=TextDecoration.underline;
  TextAlign c1=TextAlign.center;
  GlobalKey rapaintkey = GlobalKey();

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
            RepaintBoundary(
              key: rapaintkey,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(10),
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
                              style: TextStyle(
                                  color: Selected,
                                  fontFamily: textstyle,
                                  fontSize: 24,
                                fontWeight: FontWeight.normal,fontStyle:Style,decoration: TextDecoration.underline
                              ),
                              textAlign: c1,
              
              
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "-${model.name}",
                                style: TextStyle(
                                    color: Selected,
                                    fontFamily: textstyle,
                                    fontSize: 25,
                                  fontWeight: bold,
              
                                ),
                                textAlign:c1
              
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filledTonal(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(Icons.text_fields_outlined)),
                  IconButton.filledTonal(
                      onPressed: () {
                        setState(() {
                          ColorOn = !ColorOn;
                          imageOn = false;
                          textOn = false;
                        });
                      },
                      icon: Icon(Icons.color_lens_outlined)),
                  IconButton.filledTonal(
                      onPressed: () {
                        setState(() {
                          imageOn = !imageOn;
                          ColorOn = false;
                          textOn = false;
                        });
                      },
                      icon: Icon(Icons.image)),
                  IconButton.filledTonal(
                      onPressed: () {
                        setState(() {
                          textOn = !textOn;
                          ColorOn = false;
                          imageOn = false;
                        });
                      },
                      icon: Icon(Icons.text_format_outlined)),
                  IconButton.filledTonal(
                      onPressed: () {
                        setState(() async{
                            RepaintBoundary boundary = rapaintkey.currentContext!.findRenderObject() as  RepaintBoundary;

                            //  ui.Image image=boundary.to boudary;
                            // ByteData? byteData = await image.toByteData(
                            //     format: ui.ImageByteFormat.png);
                            // var bytes = byteData!.buffer.asUint8List();

                        });
                      }, icon: Icon(Icons.save)),
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
            Visibility(
              visible: textOn,
              child: Expanded(
                child: ListView.builder(
                  itemCount: textList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          textstyle = textList[index];
                        });
                      },
                      child: Container(
                          height: 50,
                          width: 80,
                          alignment: Alignment.center,
                          child: const Text(
                            "enter text font style",style: TextStyle(fontSize: 30),)),
                    );
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            bold=FontWeight.bold;

                          });
                        },
                        icon: Icon(Icons.format_bold_outlined)),
                    IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                           Style=FontStyle.italic;
                          });
                        },
                        icon: Icon(Icons.format_italic)),
                    IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            line=TextDecoration.underline;
                          });
                        },
                        icon: Icon(Icons.format_underline)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            c1=TextAlign.center;
                          });
                        },
                        icon: Icon(Icons.format_align_center)),
                    IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            c1=TextAlign.left;
                          });
                        }, icon: Icon(Icons.format_align_left)),
                    IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            c1=TextAlign.end;
                          });
                        }, icon: Icon(Icons.format_align_right)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


