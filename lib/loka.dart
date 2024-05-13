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
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        toolbarHeight: 32,
        title: const Text(
          'The Grid Lock',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              letterSpacing: 3.5),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (winner != " ")
            Card(
                color:const Color.fromARGB(201, 41, 34, 105),
                //margin:const EdgeInsets.all(50),
                elevation: 3,
                shape:const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
                child: Text(
                  '$winner WON THE GAME',
                  style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center
                )),  
          // ignore: sized_box_for_whitespace
          Container(
            height: size.height * .7,
            child: Column(
              children: [
                GridView.builder(
                    padding:const EdgeInsets.only(top: 12),
                    shrinkWrap: true,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: grid.length,
                    itemBuilder: (context, index) => Material(
                          color: Colors.green,
                          child: InkWell(
                              splashColor: Colors.red,
                              onTap: () => pxo(index),
                              child: Center(child: Text(grid[index]))),
                        )),
              const SizedBox(height: 10,),
              ElevatedButton.icon(
              onPressed: reset,
              icon:const Icon(Icons.refresh),
              label: const Text("Replay"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
