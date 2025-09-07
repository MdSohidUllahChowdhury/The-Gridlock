import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_gridlock/links.dart';

class GridLock extends StatefulWidget {
  final ThemeMode? themeMode;
  final VoidCallback? toggleTheme;

  const GridLock({super.key, this.themeMode, this.toggleTheme});

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

  final brightness = widget.themeMode == null
    ? Theme.of(context).brightness
    : (widget.themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light);

  final isDark = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 45,
        centerTitle: true,
        title: Text(
          'GRID LOCK',
          style: TextStyle(
              fontSize: 20,
              color: isDark ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.pressStart2p().fontFamily,
              letterSpacing: 4),
        ),
        actions: [
          IconButton(
            onPressed: widget.toggleTheme,
            tooltip: isDark ? 'Switch to light' : 'Switch to dark',
            icon: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 35),
          if (winner != ' ')
      Container(
                height: 52,
                width: size.width * .7,
                decoration: BoxDecoration(
          color: Colors.green[400],
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('GAME OVER\n PLAYER $winner WINS',
                      style: TextStyle(
                        fontFamily: GoogleFonts.pressStart2p().fontFamily,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
            color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      textAlign: TextAlign.center),
                )),
          const SizedBox(height: 11),
          Expanded(
            child: SizedBox(
              height: size.height * .8,
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
                              childAspectRatio: 2.8 / 3),
                      itemCount: grid.length,
                      itemBuilder: (context, index) => Material(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).colorScheme.surface,
                            child: InkWell(
                                splashColor: currentplayer == 'X'
                                    ? const Color.fromARGB(255, 2, 68, 88)
                                    : const Color.fromARGB(255, 88, 2, 68),
                                onTap: () => pxo(index),
                                child: Center(
                                    child: Text(
                                  grid[index],
                  style: TextStyle(
                    fontFamily:
                      GoogleFonts.pressStart2p().fontFamily,
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold),
                                ))),
                          )),
                  const Expanded(child: SizedBox(height: 20)),
                  ElevatedButton.icon(
                      onPressed: reset,
                      style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all<Size>(const Size(140, 45)),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary),
                      ),
                      icon: Icon(
                        Icons.refresh,
                        size: 35,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      label: Text("Replay",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontFamily: GoogleFonts.pressStart2p().fontFamily,
                          ))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text( '© Md Sohid Ullah Chowdhury',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12,
                fontFamily: GoogleFonts.robotoSerif().fontFamily,
              )),
          Divider(height: 10, thickness: 1, color: Theme.of(context).dividerColor),
          SocialLinks(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
