// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 187, 68, 241),
        centerTitle: true,
        title: Text("The Gridlock"),
        leading: ElevatedButton(onPressed: () {}, child: Icon(Icons.menu)),
      ),

      
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
              height: 350,
              width: double.infinity,

              // ignore: sort_child_properties_last
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Center(
                        child: Text(index.toString()),
                      )
                    );
                  }),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [(Colors.yellow), (Colors.red)]),
              )),
        ],
      ),
    );
  }
}
