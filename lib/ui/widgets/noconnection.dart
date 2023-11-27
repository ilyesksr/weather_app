import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isConnectedNotifier,
        builder: (context, isConnected, _) {
          return isConnected
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const FittedBox(
                        child: SizedBox(
                            height: 400,
                            width: 400,
                            child: RiveAnimation.asset('assets1/forcast.riv')),
                        //assets/no_forcast.riv
                        //images/conexion.riv
                      ),
                      Text(
                        'No Forcast Data',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 200,
                          child: Image.asset('assets2/connection.png')),
                      Text(
                        'No Internet Connection',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: 30),
                      ),
                    ],
                  ),
                );
        });
  }
}

ValueNotifier<bool> isConnectedNotifier = ValueNotifier(false);
/*
Stack(
                  children: [
                    const FittedBox(
                      child: SizedBox(
                          height: 300,
                          width: 300,
                          child: RiveAnimation.asset('assets2/conexion.riv')),
                      //assets/no_forcast.riv
                      //images/conexion.riv
                    ),
                    Positioned(
                      bottom: -5,
                      right: 10,
                      left: 10,
                      child: Text(
                        'No Internet Connection',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                );
*/