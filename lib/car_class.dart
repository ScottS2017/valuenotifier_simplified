import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarModel{
// Private members
  static final List<Color> _colors = <Color>[
    Colors.white,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  static final List<Color> _trafficLightColors = <Color>[
    Colors.red,
    Colors.green,
  ];

  static final List<String> _carNamesAndColors = <String>[
    'White\nBMW',
    'Yellow\nAudi',
    'Orange\nMercedes',
    'Purple\nTesla',
  ];

  static final List<String> _stringsForStopAndGo = <String>[
    'Stopped',
    'Moving',
  ];

  // Private ValueNotifiers with getters
  final ValueNotifier<Color> _color = ValueNotifier<Color>(_colors[0]);
  ValueNotifier<Color> get color => _color;

  final ValueNotifier<String> _name = ValueNotifier<String>(_carNamesAndColors[0]);
  ValueNotifier<String> get name => _name;

  final ValueNotifier<Color> _trafficLightColor = ValueNotifier<Color>(_trafficLightColors[0]);
  ValueNotifier<Color> get trafficLightColor => _trafficLightColor;

  final ValueNotifier<String> _stopAndGoText = ValueNotifier<String>(_stringsForStopAndGo[0]);
  ValueNotifier<String> get stopAndGoText => _stopAndGoText;

  // Public (actually Package Private) methods
  void changeTheCarColor() {
    final int indexValue =  (_colors.indexOf(_color.value) + 1) % _colors.length;
    _color.value = _colors[indexValue];
    _name.value = _carNamesAndColors[indexValue];
  }

  void changeTheLightColor() {
    final int indexValue =  (_trafficLightColors.indexOf(_trafficLightColor.value) + 1) % _trafficLightColors.length;
    _trafficLightColor.value = _trafficLightColors[indexValue];
    _stopAndGoText.value = _stringsForStopAndGo[indexValue];
  }
}
