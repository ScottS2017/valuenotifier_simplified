import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuenotifier_simplified_video/fleet_of_cars.dart';
import 'package:valuenotifier_simplified_video/ui_page.dart';

void main() {
  runApp(VNSExample());
}

class VNSExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Provider<FleetOfCars>(
      create: (BuildContext context) => FleetOfCars(),
      child: const MaterialApp(
        home: UserInterface(),
      ),
    );
  }
}