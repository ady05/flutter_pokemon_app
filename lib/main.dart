import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pokemon App',
      home: MyHomePage(),
      theme: ThemeData(
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollable(context),
    );
  }
  Widget _buildScrollable(BuildContext context){
    return CustomScrollView(
      slivers: [
        SliverAppBar(
           flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
                   background: Image.asset(
              'assets/images/pokemon.jpg',
          fit: BoxFit.cover,
                   ),
           ),

          floating: false,
          snap: false,
          pinned: false,
          expandedHeight: 350,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int itm){
                return Container(

                );
              }
          )
        ),
      ],
    );
  }

}


