import 'package:flutter/material.dart';

import '../model/Counter.dart';

class CounterProvider1 extends ChangeNotifier{
  final Counter1 _counter = Counter1(0);
  Counter1 get counter => _counter;

  void increment(){
    _counter.count++;
    notifyListeners();
  }

  void decrement(){
    _counter.count--;
    notifyListeners();
  }
}