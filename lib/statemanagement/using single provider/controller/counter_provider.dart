import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/statemanagement/using%20single%20provider/model/Counter.dart';

class CounterProvider extends ChangeNotifier{
  final Counter _counter = Counter(0);
  Counter get counter => _counter;

  void increment(){
    _counter.count++;
    notifyListeners();
  }

  void decrement(){
    _counter.count--;
    notifyListeners();
  }
}