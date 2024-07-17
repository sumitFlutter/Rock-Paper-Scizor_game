import 'package:flutter/material.dart';
import 'dart:math';

import 'package:rock_paper_scizors/utils/shared_helper.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    win = widget.winner;
    loss = widget.lossA;
    total = widget.totalA;
    draw = widget.drawA;
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                bots,
                height: bots != "assets/image/00.png" ? 200 : 179,
                width: bots != "assets/image/00.png" ? 200 : 250,
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
                height: players != "assets/image/01.png" ? 200 : 118,
                width: players != "assets/image/01.png" ? 200 : 250,
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
                width: MediaQuery.sizeOf(context).width * 0.40,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2 ),
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
                            setState(() async {
                              await SharedHelper.sharedHelper.setWinScore(0);
                              await SharedHelper.sharedHelper.setLossScore(0);
                              await SharedHelper.sharedHelper.setTotalScore(0);
                              await SharedHelper.sharedHelper.setDraw(0);
                              total = await SharedHelper.sharedHelper
                                  .getTotalScore();
                              draw = await SharedHelper.sharedHelper.getDraw();
                              win =
                                  await SharedHelper.sharedHelper.getWinScore();
                              loss = await SharedHelper.sharedHelper
                                  .getLossScore();
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
                    const Divider(),
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
      winner = "It's DRAW";
      await SharedHelper.sharedHelper.setDraw(draw++);
      draw = await SharedHelper.sharedHelper.getDraw();
    } else if (bot == 0 && player == 1) {
      winner = "You Win";
      await SharedHelper.sharedHelper.setWinScore(win++);
      win = await SharedHelper.sharedHelper.getWinScore();
    } else if (bot == 1 && player == 0) {
      await SharedHelper.sharedHelper.setLossScore(loss++);
      loss = await SharedHelper.sharedHelper.getLossScore();
      winner = "You Lost";
    } else if (bot == 0 && player == 2) {
      await SharedHelper.sharedHelper.setLossScore(loss++);
      loss = await SharedHelper.sharedHelper.getLossScore();
      winner = "You Lost";
    } else if (bot == 2 && player == 0) {
      winner = "You Win";
      await SharedHelper.sharedHelper.setWinScore(win++);
      win = await SharedHelper.sharedHelper.getWinScore();
    } else if (bot == 1 && player == 2) {
      winner = "You Win";
      await SharedHelper.sharedHelper.setWinScore(win++);
      win = await SharedHelper.sharedHelper.getWinScore();
    } else if (bot == 2 && player == 1) {
      await SharedHelper.sharedHelper.setLossScore(loss++);
      loss = await SharedHelper.sharedHelper.getLossScore();
      winner = "You Lost";
    }
    await SharedHelper.sharedHelper.setTotalScore(total++);
    total = await SharedHelper.sharedHelper.getTotalScore();
  }
}
