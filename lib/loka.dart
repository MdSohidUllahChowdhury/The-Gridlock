// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Loka extends StatefulWidget {
  const Loka({super.key});

  @override
  State<Loka> createState() => _LokaState();
}

class _LokaState extends State<Loka> {

var grid = [
  " ", " ", " ",
  " ", " ", " ",
  " ", " ", " ",
];

var currentplayer = 'X';

void pxo(i){
  setState(() {

    if(grid[i] == " "){
      grid[i] = currentplayer;

    currentplayer = currentplayer == 'X' ? 'O' : 'X';
    }
    
    
    //!NOTE
     //? if currentplayer is "X" ? then turn to "O"
    //?  if currentplayer is "O" : "X"
  });
}

void reset (){
  setState(() {
    grid = [
  " ", " ", " ",
  " ", " ", " ",
  " ", " ", " ",
];
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Grid Lock',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),
        toolbarHeight: 32,
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),


      body: Column(
        children: [ SizedBox(height: 2,),
          Container( 
            height: 320,
            width: double.infinity,
            child: GridView.builder(padding: EdgeInsets.only(top: 12),
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ), 
              itemCount: grid.length,
            
              itemBuilder: (context, index) => 
              Material(color: Colors.green,
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: ()=> pxo(index),
                  child: Center(
                  child: Text(grid[index])
                  )),
              )),
          ),
          ElevatedButton(onPressed: reset, child: Text('Play Agin!!'),)
        ],
      ),
    );
  }
}