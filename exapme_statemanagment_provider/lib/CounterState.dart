import 'package:flutter/cupertino.dart';

class CounterState extends ChangeNotifier{
  int _counter = 0;

  void increment(){
    _counter++;
    notifyListeners();
  }
  void decrement(){
    _counter--;
    notifyListeners();
  }

  int getState(){
    return _counter;
  }
}