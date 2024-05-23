import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? timer;

  Debouncer({
    required this.milliseconds
  });

  run(VoidCallback action){
    if(timer != null) {
      timer?.cancel();
    }
    timer = Timer(Duration(microseconds: milliseconds), action);
  }


}