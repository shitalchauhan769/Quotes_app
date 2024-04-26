import 'package:flutter/material.dart';
import 'package:quotes_app/screen/model/qoute_model.dart';

import '../../until/globel.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List<QuoteModel> l1 = [];

  @override
  Widget build(BuildContext context) {
   l1 =
        ModalRoute.of(context)!.settings.arguments as List<QuoteModel>;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "title",style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: l1.length,
        itemBuilder: (context, index) {
          return Quotes(index);
        },
      ),
    );
  }

  Widget Quotes(int index) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.5),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), bottomLeft: Radius.circular(50))),
      child: Column(
        children: [
          Text(
            "${l1[index].quotes}",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "${l1[index].name}",
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
