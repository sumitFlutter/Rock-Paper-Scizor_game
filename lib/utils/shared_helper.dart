import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper{
  static SharedHelper sharedHelper=SharedHelper();
  int total=0;
  int win=0;
  int draw=0;
  int loss=0;
  Future<void> setWinScore(int win)
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    shr.setInt("win", win);
  }
  Future<int> getWinScore()
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    if(shr.getInt("win")!=null)
      {
        win=shr.getInt("win")!;
      }
    return win;
  }
  Future<void> setLossScore(int loss)
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    shr.setInt("loss", loss);
  }
  Future<int> getLossScore()
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    if(shr.getInt("loss")!=null)
      {
        loss=shr.getInt("loss")!;
      }
    return loss;
  }
  Future<void> setTotalScore(int total)
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    shr.setInt("total", total);
  }
  Future<int> getTotalScore()
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    if(shr.getInt("total")!=null)
      {
        total=shr.getInt("total")!;
      }
    return total;
  }
  Future<void> setDraw(int draw)
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    shr.setInt("draw", draw);
  }
  Future<int> getDraw()
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    if(shr.getInt("draw")!=null)
      {
        draw=shr.getInt("draw")!;
      }
    return draw;
  }


}