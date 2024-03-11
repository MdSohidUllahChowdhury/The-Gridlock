// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, non_constant_identifier_names
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {


  bool ohTurn = true; //! The frist player is "O"
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

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
          SizedBox(height: 15),
          Container(
              height: 350,
              width: double.infinity,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          tapted(index);
                        },
                        child: Container(
                            decoration: BoxDecoration(




                                
                                      border: Border.all(color: Colors.black)),
                            child: Center(
                              child: Text(displayXO[index]),
                            )),
                      ),
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

  void tapted(int index) {
    setState(() {
      if (ohTurn){
        displayXO[index] = 'O';
      }else{
        displayXO[index] = 'X';
      }
    });
  }

  void checkWinner(){

  }

  void showWin(){

  }
}
