// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

//todo 1 (next search_and_filter_todo.dart)

class Debaounce {
  final int milliseconds;
  Debaounce({
    this.milliseconds = 500,
  });

  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
