import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final int delay;
  late VoidCallback action;
  Timer? _timer;

  Debounce({required this.delay});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }

    _timer = Timer(Duration(milliseconds: delay), action);
  }

  cancel() {
    _timer?.cancel();
  }
}