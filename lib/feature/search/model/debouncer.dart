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
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }


}