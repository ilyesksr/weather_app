import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isConnectedNotifier,
        builder: (context, isConnected, _) {
          return isConnected
              ? const Center(child: Text('No Result'))
              : Container(
                  height: 20,
                  width: 20,
                  color: Colors.blue,
                );
        });
  }
}

ValueNotifier<bool> isConnectedNotifier = ValueNotifier(false);
