import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuenotifier_simplified_video/fleet_of_cars.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({
    Key key,
  }) : super(key: key);

  @override
  _UserInterfaceState createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  @override
  Widget build(BuildContext context) {
    ///
    /// Provide an instance of our CollectionOfCars we can use.
    final FleetOfCars providedFleetOfCars = Provider.of<FleetOfCars>(context);

    ///
    return Scaffold(
      appBar: AppBar(
        title: const Text('VNS Example '),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          const Text(
            'There is only one providedFleetOfCars',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Center(
                        ///
                        /// Car 1
                        ///
                        child: Text(
                          'Car 1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /// Here we go...
                      ValueListenableBuilder<Color>(
                        valueListenable: providedFleetOfCars.car1.color,

                        /// The linter is complaining that the child isn't last, but
                        /// for the purpose of explaining, it's easier to follow
                        /// this way. The rest of the app has the children last.
                        child: const Icon(
                          Icons.directions_car,
                          color: Colors.black54,
                        ),

                        ///
                        builder: (
                          BuildContext context,

                          /// Normally called "value"
                          Color theValuePassedInFromTheValueNotifierOnAnUpdate,

                          /// Normally called "child"
                          Widget theChildOfTheValueListenableBuilder,
                        ) {
                          return FloatingActionButton(
                            backgroundColor: theValuePassedInFromTheValueNotifierOnAnUpdate,

                            /// Calling a method
                            onPressed: () => providedFleetOfCars.car1.changeTheCarColor(),
                            child: theChildOfTheValueListenableBuilder,
                          );
                        },
                      ),
                      ValueListenableBuilder<String>(
                        /// Listen to the ValueListenable (via the getter)
                        /// but use it's VALUE
                        valueListenable: providedFleetOfCars.car1.name,

                        /// If you think about it, when addressing it directly
                        /// we need to remember to use ".value" everywhere
                        /// except the builder. This is because the builder is
                        /// already assigning the value of the ValueNotifier to
                        /// the second parameter of the builder, saving you
                        /// the trouble
                        builder: (BuildContext context, String value, _) {
                          print('Car 1 Name Text Rebuilt');
                          return Text(
                            /// It's easy to look right past this, but here's where
                            /// we're using the value from the ValueNotifier
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          );
                        },
                      ),
                      const HorizontalLine(),
                      ValueListenableBuilder<Color>(
                        valueListenable: providedFleetOfCars.car1.trafficLightColor,
                        builder: (BuildContext context, Color value, Widget child) {
                          return FloatingActionButton(
                            backgroundColor: value,
                            onPressed: () => providedFleetOfCars.car1.changeTheLightColor(),
                            child: child,
                          );
                        },
                        child: const Icon(
                          Icons.traffic,
                          color: Colors.black54,
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: providedFleetOfCars.car1.stopAndGoText,
                        builder: (BuildContext context, String value, _) {
                          print('Car 1 Moving Text Rebuilt');
                          return Text(
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const VerticalLine(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ///
                      /// Car 2
                      ///
                      const Center(
                        child: Text(
                          'Car 2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ValueListenableBuilder<Color>(
                        valueListenable: providedFleetOfCars.car2.color,
                        builder: (BuildContext context, Color value, Widget child) {
                          return FloatingActionButton(
                            backgroundColor: value,
                            onPressed: () => providedFleetOfCars.car2.changeTheCarColor(),
                            child: child,
                          );
                        },
                        child: const Icon(
                          Icons.directions_car,
                          color: Colors.black54,
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: providedFleetOfCars.car2.name,
                        builder: (BuildContext context, String value, _) {
                          print('Car 2 Name Text Rebuilt');
                          return Text(
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          );
                        },
                      ),
                      const HorizontalLine(),
                      ValueListenableBuilder<Color>(
                        valueListenable: providedFleetOfCars.car2.trafficLightColor,
                        builder: (BuildContext context, Color value, Widget child) {
                          return FloatingActionButton(
                            backgroundColor: value,
                            onPressed: () => providedFleetOfCars.car2.changeTheLightColor(),
                            child: child,
                          );
                        },
                        child: const Icon(
                          Icons.traffic,
                          color: Colors.black54,
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: providedFleetOfCars.car2.stopAndGoText,
                        builder: (BuildContext context, String value, _) {
                          print('Car 2 Moving Text Rebuilt');
                          return Text(
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const VerticalLine(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ///
                      /// Car 3
                      ///
                      const Center(
                        child: Text(
                          'Car 3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ValueListenableBuilder<Color>(
                        valueListenable: providedFleetOfCars.car3.color,
                        builder: (BuildContext context, Color value, Widget child) {
                          return FloatingActionButton(
                            backgroundColor: value,
                            onPressed: () => providedFleetOfCars.car3.changeTheCarColor(),
                            child: child,
                          );
                        },
                        child: const Icon(
                          Icons.directions_car,
                          color: Colors.black54,
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: providedFleetOfCars.car3.name,
                        builder: (BuildContext context, String value, _) {
                          print('Car 3 Name Text Rebuilt');
                          return Text(
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          );
                        },
                      ),
                      const HorizontalLine(),
                      ValueListenableBuilder<Color>(
                        valueListenable: providedFleetOfCars.car3.trafficLightColor,
                        builder: (BuildContext context, Color value, Widget child) {
                          return FloatingActionButton(
                            backgroundColor: value,
                            onPressed: () => providedFleetOfCars.car3.changeTheLightColor(),
                            child: child,
                          );
                        },
                        child: const Icon(
                          Icons.traffic,
                          color: Colors.black54,
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: providedFleetOfCars.car3.stopAndGoText,
                        builder: (BuildContext context, String value, _) {
                          print('Car 3 Moving Text Rebuilt');
                          return Text(
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: 3,
        color: Colors.black45,
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: 3,
        color: Colors.black45,
      ),
    );
  }
}
