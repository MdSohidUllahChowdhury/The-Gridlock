import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_gridlock/links.dart';

class GridLock extends StatefulWidget {
  const GridLock({super.key});

  @override
  State<GridLock> createState() => _GridLockState();
}

class _GridLockState extends State<GridLock> {
  var grid = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
  ];

  var currentplayer = 'X';

  void pxo(i) {
    setState(() {
      if (grid[i] == " ") {
        grid[i] = currentplayer;

        currentplayer = currentplayer == 'X' ? 'O' : 'X';
      }
      //!NOTE
      //? if currentplayer is "X" ? then turn to "O"
      //?  if currentplayer is "O" : "X"
    });
    findWinner(grid[i]);
  }

  void reset() {
    setState(() {
      winner = " ";
      grid = [
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
      ];
    });
  }

  var winner = '';

  bool checkMove(i1, i2, i3, sing) {
    if (grid[i1] == sing && grid[i2] == sing && grid[i3] == sing) {
      return true;
    }
    return false;
  }

  void findWinner(currentSing) {
    if (checkMove(0, 1, 2, currentSing) ||
            checkMove(3, 4, 5, currentSing) ||
            checkMove(6, 7, 8, currentSing) || //ROW
            checkMove(0, 3, 6, currentSing) ||
            checkMove(1, 4, 7, currentSing) ||
            checkMove(2, 5, 8, currentSing) || //Column
            checkMove(0, 4, 8, currentSing) ||
            checkMove(2, 4, 6, currentSing) //Diagonal
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
        backgroundColor: Colors.black,
        elevation:15,
        toolbarHeight:45,
        centerTitle: true,
        title:  Text(
          'GRID LOCK',
          style: TextStyle(
              fontSize:20,
              color: Colors.white, 
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.robotoSerif().fontFamily, 
              letterSpacing: 4),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height:35),
          if (winner != ' ')
            Container(
                padding: const EdgeInsets.all(12),
                height: 52,
                width: size.width * .7,
                decoration: const BoxDecoration(
                    color: Color(0xff1E201E),
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                child: Text('$winner WON THE GAME',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      letterSpacing:5,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center)),
          const SizedBox(height: 11),
          Expanded(
            child: SizedBox(
              height: size.height*.8,
              child: Column(
                children: [
                  GridView.builder(
                      padding: const EdgeInsets.only(top: 12),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 2.4/3
                      ),
                      itemCount: grid.length,
                      itemBuilder: (context, index)
                       => Material(
                            color:const Color.fromARGB(255, 172, 171, 166),
                            child: InkWell(
                                splashColor: Colors.red,
                                hoverColor: const Color.fromARGB(255, 68, 2, 88),
                                onTap: () => pxo(index),
                                child: Center(
                                    child: Text(
                                  grid[index],
                                  style: const TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.bold),
                                ))),
                          )),
                  const Expanded(child: SizedBox(height: 20)),
                  ElevatedButton.icon(
                      onPressed: reset,
                      style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all<Size>(const Size(140, 45)),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color.fromARGB(255, 21, 1, 68)),
                      ),
                      icon: const Icon(
                        Icons.refresh,
                        size: 35,
                        color: Colors.white,
                      ),
                      label: const Text("R e p l a y",
                          style: TextStyle(
                            color: Colors.white,
                          ))),

                ],
              ),
            ),
          ),
          const SizedBox(height:20),
          SocialLinks(),
          const SizedBox(height:30),
        ],
      ),
    );
  }
}
