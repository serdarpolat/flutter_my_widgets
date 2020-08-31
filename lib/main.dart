import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_widgets/pages.dart';
import 'package:my_widgets/widgets/page_indicator2.dart';
import 'package:my_widgets/widgets/sliding_parallax_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SlidingCardsView(),
    );
  }
}
