import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title,
      required this.winner,
      required this.totalA,
      required this.lossA,
      required this.drawA});

  final String title;
  final int winner, lossA, totalA, drawA;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int player = 0;
  int bot = 0;
  String players = "assets/image/01.png";
  String bots = "assets/image/00.png";
  String winner = "";
  Random random = Random();
  int win = 0;
  int loss = 0;
  int total = 0;
  int draw = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                bots,
                height: bots != "assets/image/00.png" ? 150 : 179,
                width: bots != "assets/image/00.png" ? 150: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                winner,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Image.asset(
                players,
                height: players != "assets/image/01.png" ? 150 : 118,
                width: players != "assets/image/01.png" ? 150: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          winner = "";
                          player = 0;
                          checkWinner();
                        });
                      },
                      icon: Image.asset(
                        "assets/image/icon1.png",
                        height: 52,
                        width: 52,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          winner = "";
                          player = 1;
                          checkWinner();
                        });
                      },
                      icon: Image.asset(
                        "assets/image/icon2.png",
                        height: 52,
                        width: 52,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          winner = "";
                          player = 2;
                          checkWinner();
                        });
                      },
                      icon: Image.asset(
                        "assets/image/icon3.png",
                        height: 52,
                        width: 52,
                        fit: BoxFit.cover,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width*0.7,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Score:-",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              total=0;
                              win=0;
                              loss=0;
                              draw=0;
                              winner="";
                              players = "assets/image/01.png";
                              bots = "assets/image/00.png";
                            });
                          },
                          label: const Text("Reset"),
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Divider(color: Colors.white,),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Winning Match:"),
                          Text(
                            win.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Loosing Match:"),
                          Text(
                            loss.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Draw in Match:"),
                          Text(
                            draw.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Match:"),
                          Text(
                            total.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> checkWinner() async {
    bot = random.nextInt(3);
    players = "assets/image/$player.png";
    bots = "assets/image/00$bot.png";
    if (bot == player) {
      draw++;
      winner = "It's DRAW";
    } else if (bot == 0 && player == 1) {
      winner = "You Win";
      win++;
    } else if (bot == 1 && player == 0) {
      loss++;
      winner = "You Lost";
    } else if (bot == 0 && player == 2) {
      loss++;
            winner = "You Lost";
    } else if (bot == 2 && player == 0) {
      win++;
      winner = "You Win";
    } else if (bot == 1 && player == 2) {
      win++;
      winner = "You Win";
          } else if (bot == 2 && player == 1) {
      loss++;
      winner = "You Lost";
    }
    total++;
  }
}
