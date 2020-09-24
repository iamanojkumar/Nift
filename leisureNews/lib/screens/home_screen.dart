import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: 'Feature',
            ),
            Tab(
              text: 'Headlines',
            ),
            Tab(
              text: 'Entertainment',
            ),
            Tab(
              text: 'Health',
            ),
            Tab(
              text: 'Politics',
            ),
            Tab(
              text: 'Global',
            ),
            Tab(
              text: 'Sports',
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('lesiure'),
            Text(
              'NEWS',
              style: TextStyle(color: Colors.amber),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: null,
      ),
    );
  }
}

class CategoriesTitle extends StatelessWidget {
  final String imageurl, categorieName;
  CategoriesTitle(this.categorieName, this.imageurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(
            imageurl,
            width: 120,
            height: 60,
          )
        ],
      ),
    );
  }
}
