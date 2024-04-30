import 'package:flutter/material.dart';
class SlaseScreen extends StatefulWidget {
  const SlaseScreen({super.key});

  @override
  State<SlaseScreen> createState() => _SlaseScreenState();
}

class _SlaseScreenState extends State<SlaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: NetworkImage(""),),
      ),
    );
  }
}
