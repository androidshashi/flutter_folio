import 'package:flutter/material.dart';

class MouseViewModel extends ChangeNotifier {
  Offset _ballPosition = Offset.zero;
  final List<Offset> _trail = []; // Store previous positions for the trail

  Offset get ballPosition => _ballPosition;
  List<Offset> get trail => _trail;

  void updateMousePosition(Offset position) {
    _ballPosition = position;

    // Add the current position to the trail
    _trail.add(position);
    if (_trail.length > 20) {
      // Limit the trail length to 20 positions
      _trail.removeAt(0);
    }

    notifyListeners();
  }
}
