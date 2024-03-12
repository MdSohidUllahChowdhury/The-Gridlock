// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

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
  findWinner(grid[i]);
}

void reset (){
  setState(() {
    winner = " ";
    grid = [
  " ", " ", " ",
  " ", " ", " ",
  " ", " ", " ",
];
  });
}
var winner = '';

bool checkMove(i1,i2,i3,sing){
if(grid[i1]==sing && grid[i2]== sing && grid[i3]== sing){
  return true;
}
return false;
}

void findWinner(currentSing){

if(
  checkMove(0, 1, 2, currentSing) || checkMove(3, 4, 5, currentSing) || checkMove(6, 7, 8, currentSing)|| //ROW
  checkMove(0, 3, 6, currentSing) || checkMove(1, 4, 7, currentSing) || checkMove(2, 5, 8, currentSing) || //Colomn
  checkMove(0, 4, 8, currentSing) || checkMove(2, 4, 6, currentSing) //Digonal
) {
setState(() {
  winner = currentSing;
});
}

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
        
        children: [ if (winner != " ") Text('$winner WON THE GAME'),
          SizedBox(height: 2,),
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
          
          ElevatedButton.icon(
            onPressed: reset,
            icon: Icon(Icons.refresh), 
            label: Text("Replay"))
        ],
      ),
    );
  }
}