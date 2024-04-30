import 'package:flutter/material.dart';
import 'package:quotes_app/screen/edit/edit_screen.dart';
import 'package:quotes_app/screen/quotes/quotes_screen.dart';
import 'package:quotes_app/screen/slase/slase_screen.dart';
import '../screen/home/home_screen.dart';
Map<String,WidgetBuilder>app_routs={
  '/':(context) => HomeScreen(),
  'quotes':(context) => QuotesScreen(),
  'edit':(context) => EditScreen(),
};