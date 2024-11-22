import 'package:flutter/material.dart';
import 'package:the_gridlock/grid_lock.dart';

void main() {
  runApp((
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const GridLock(),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Game'
      ),
    )
  ));
}
