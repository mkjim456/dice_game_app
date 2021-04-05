import 'dart:math';

import 'package:flutter/material.dart';

class DiceGamePage extends StatefulWidget {
  @override
  _DiceGamePageState createState() => _DiceGamePageState();
}

class _DiceGamePageState extends State<DiceGamePage> {
  final diceList = <String>[
    'images/d1.png', 'images/d2.png', 'images/d3.png', 'images/d4.png',
        'images/d5.png', 'images/d6.png' ];
  bool _hasStarted = false, _canRoll = false, isGameOver = false;
  int index1 = 0, index2 = 0, score = 0, sum = 0, highScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Dice Game'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text('Score: $score', style: TextStyle(fontSize: 30),),
            Text('Sum: $sum', style: TextStyle(fontSize: 20),),
            Text('HighScore: $highScore', style: TextStyle(fontSize: 30),),
            SizedBox(height: 30,),
            if(_canRoll) Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(diceList[index1], width: 100, height: 100, fit: BoxFit.cover,),
                Image.asset(diceList[index2], width: 100, height: 100, fit: BoxFit.cover,),
              ]),
            SizedBox(height: 30,),
            if(!_hasStarted) ElevatedButton(onPressed: _startGame, child: Text('START')),
            if(_hasStarted)  ElevatedButton(onPressed: _rollDice, child: Text('Roll the Dice')),
            SizedBox(height: 30,),
            if(isGameOver) Text('Game Over!!', style: TextStyle(fontSize: 40),),

          ],
        ),
      ),
    );
  }

  void _rollDice() {

    if(!_canRoll){
      setState(() {
        _canRoll = true;
      });
    }


    final random = Random();
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);



      if((index1 + index2 + 2) == 7){
        setState(() {
          _canRoll = false;
          isGameOver = true;
          _hasStarted = false;
          sum = index1 + index2 + 2;
        });

      }else{
        score += index1 + index2 + 2;
        sum = index1 + index2 + 2;
      }
    });

    if (score > highScore){highScore = score;}

  }

  void _startGame() {
      setState(() {
        _hasStarted = true;
        isGameOver = false;
        score = 0;
        sum =0;

      });

  }
}














































/*import 'dart:math';
import 'package:flutter/material.dart';
class DiceGamePage extends StatefulWidget {
  @override
  _DiceGamePageState createState() => _DiceGamePageState();
}
class _DiceGamePageState extends State<DiceGamePage> {
 final diceList = <String> [
   'images/d1.png',
   'images/d2.png',
   'images/d3.png',
   'images/d4.png',
   'images/d5.png',
   'images/d6.png',
 ];
 bool _hasStarted = false, _canRoll = false, isGameOver = false;
 int index1 = 0, index2 = 0, score = 0, sum = 0, highScore =0;

 //initial value of highscore is 0 . logic will be score > highscore

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dice game"),
        ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
          children: [
            Text('Score: $score',style: TextStyle(fontSize: 20, color: Colors.indigo),),
            if(_canRoll || isGameOver) Text('Sum: $sum'),
            SizedBox(height: 40,),
            if(_canRoll)
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Image.asset(diceList[index1], width: 100, height: 100, fit: BoxFit.cover,),
                 Image.asset(diceList[index2], width: 100, height: 100, fit: BoxFit.cover,),
                  ],
               ),
            SizedBox(height: 30,),
            if(!_hasStarted) ElevatedButton(onPressed: _startGame, child: Text('Start')),
            if(_hasStarted) ElevatedButton(onPressed: _rollDice, child: Text('Roll the Dice')),
            if(isGameOver)  Text('Game Over!!'),
          ],
        ),
      ),
    );
  }
  void _rollDice(){
    if(!_canRoll){
      setState(() {
        _canRoll = true;
      });
    }
    final random = Random();
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      if((index1 + index2 +2) == 7){
        setState(() {
          _canRoll = false;
          _hasStarted = false;
          isGameOver = true;
          sum = index1 + index2 + 2;
        });
      }  else {
        score += index1 + index2 +2;
        sum = index1 + index2 +2;
      }
    });
  }
  void _startGame(){
    _hasStarted = true;
    isGameOver = false;
    score = 0;
    sum = 0;
    highScore = 0;
  }
}  */
