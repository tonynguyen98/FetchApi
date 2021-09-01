import 'package:api_fetch/views/home.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FetchApi());
}

class FetchApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FetchApi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
