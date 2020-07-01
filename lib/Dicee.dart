import 'dart:math';
// import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:flutter/material.dart';

class Dicee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  int leftDiceNumber = 1;
  var rightDiceNumber = 1;
  int playerID = 1;
  int playerID2 = 2;
  int total;

  void _diceResult() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;

      total = rightDiceNumber + leftDiceNumber;
      print("you pressed the dice");
      playerID = playerID2;
    });
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'My score on DicerApp was  ',
        text: """My score on DicerApp was $total,
 Download the DicerApp lets play together""",
        chooserTitle: "DicerApp Score Share");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xffff5a87),
        appBar: AppBar(
          // backgroundColor: const Color(0xffff5a87),
          title: Text("Dicerapp"),
          centerTitle: true,
          titleSpacing: 2,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: share,
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 80.0, right: 30, left: 30),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Player $playerID: Tap on Dices to roll",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "You rolled  ",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        FlatButton(
                            onPressed: () => _diceResult(),
                            child:
                                Image.asset("images/dice$leftDiceNumber.png")),
                        SizedBox(height: 20),
                        Text(
                          "$leftDiceNumber",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),

                  //Second Dice

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "You rolled  ",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        FlatButton(
                            onPressed: () => _diceResult(),
                            child:
                                Image.asset("images/dice$rightDiceNumber.png")),
                        SizedBox(height: 20),
                        Text(
                          "$rightDiceNumber",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text(
                  "Total Dice rolled =   $total ",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: SafeArea(
              child: ListView(children: <Widget>[
            Container(
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/loader.jpg"))),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Center(
                        child: Text("DicerApp",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Roboto")),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.plus_one),
                      title: Text("Create new player"),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Player 1"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Player 2"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.close),
                      title: Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
          ])),
        ),
      ),
    );
  }
}
