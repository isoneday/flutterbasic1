import 'package:flutter/material.dart';

class StateArgument {
  int counter;
  ValueChanged decrementCounter;

  StateArgument(this.counter, this.decrementCounter);
}
