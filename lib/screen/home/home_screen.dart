
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int player=0;
  int bot=0;
  String players="assets/image/01.png";
  String bots="assets/image/00.png";
  String winner="";
  Random random=Random();
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

              Image.asset(bots,height:bots!="assets/image/00.png"? 200:179,width: bots!="assets/image/00.png"?200:80,fit: BoxFit.cover,),
              const SizedBox(height: 5,),
              Text(winner,style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Image.asset(players,height: players!="assets/image/01.png"?200:118,width: players!="assets/image/01.png"?200:41,fit: BoxFit.cover,),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {
                    setState(() {
                      winner="";
                      player=0;
                      checkWinner();
                    });
                  }, icon: Image.asset("assets/image/icon1.png",height: 52,width: 52,fit: BoxFit.cover,)),
                  const SizedBox(width: 5,),
                  IconButton(onPressed: () {
                    setState(() {
                      winner="";
                      player=1;
                      checkWinner();
                    });
                  }, icon: Image.asset("assets/image/icon2.png",height: 52,width: 52,fit: BoxFit.cover,)),
                  const SizedBox(width: 5,),
                  IconButton(onPressed: () {
                    setState(() {
                      winner="";
                      player=2;
                      checkWinner();
                    });
                  }, icon: Image.asset("assets/image/icon3.png",height: 52,width: 52,fit: BoxFit.cover,)),
                ],
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void checkWinner()
  {
    bot=random.nextInt(3);
    players="assets/image/$player.png";
    bots="assets/image/00$bot.png";
    if(bot==player)
      {
        winner="It's DRAW";
      }
    else if(bot==0&&player==1)
    {
      winner="You Win";
    }
    else if(bot==1&&player==0)
    {
      winner="You Lost";
    }else if(bot==0&&player==2)
    {
      winner="You Lost";
    }else if(bot==2&&player==0)
    {
      winner="You Win";
    }else if(bot==1&&player==2)
    {
      winner="You Win";
    }else if(bot==2&&player==1)
    {
      winner="You Lost";
    }


  }
}
