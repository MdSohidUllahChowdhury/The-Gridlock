// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, non_constant_identifier_names, prefer_interpolation_to_compose_strings

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


      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          
          Container(
              height: 300,
              width: double.infinity,

              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) 
                  
                  { 
                    return GestureDetector(
                      onTap: () {
                        tapted(index);
                      },
                      child: Container(
                          decoration:
                           BoxDecoration(
                           border: Border.all(color: const Color.fromARGB(255, 243, 94, 94))
                                        ),
                          
                          child: Center(
                            
                          child: Text(displayXO[index],
                          style: TextStyle(fontSize: 800,fontWeight: FontWeight.bold),),
                          )
                          ),
                    );
                  }
                  ),


                decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [(Colors.yellow), (Colors.red)]),
              )
              ),
        ],
      ),
    );
  }

  void tapted(int index) {
    
    setState(() {
      if (ohTurn && displayXO[index] == " "){
        displayXO[index] = 'O';
      }else if (!ohTurn && displayXO[index] == " "){
        displayXO[index] = 'X';
      }

      ohTurn = !ohTurn; //Ekbar ekta press krle next player er turn hobe.
      CheckWinner();
    });
  }

  void CheckWinner(){
//R1
if(displayXO[0] == 
   displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != " ") {
ShowWin(displayXO[0]);
 }

 //R2
if(displayXO[3] == 
   displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3] != " ") {
ShowWin(displayXO[3]);
 }

 //R3
if(displayXO[6] == 
   displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6] != " ") {
ShowWin(displayXO[6]);
 }

//C1
if(displayXO[0] == 
   displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0] != " ") {
ShowWin(displayXO[0]);
 }

 //C2
if(displayXO[1] == 
   displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1] != " ") {
ShowWin(displayXO[1]);
 }

 //C3
if(displayXO[2] == 
   displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2] != " ") {
ShowWin(displayXO[2]);
 }

 //CROSS1
if(displayXO[6] == 
   displayXO[4] && displayXO[6] == displayXO[2] && displayXO[6] != " ") {
ShowWin(displayXO[6]);
 }

 //CROSS2
if(displayXO[0] == 
   displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0] != " ") {
ShowWin(displayXO[0]);
 }

}

  }

  void ShowWin( String winner){
   
    

  }

    
