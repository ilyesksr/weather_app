import 'package:flutter/material.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/models/current.dart';

class CurrentForcast extends StatelessWidget {
  final CurrentWeatherModel currentWeath;
  final int icon;
  const CurrentForcast(this.currentWeath, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Theme.of(context).colorScheme.onSecondary,
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${currentWeath.tempC.toInt()}°',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      '${currentWeath.tempF.toInt()}°F',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    )
                  ],
                ),
                Text(
                  currentWeath.condtionText,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  height: padding,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        '${currentWeath.name}, ${currentWeath.region}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    Text(
                      '${currentWeath.localTime} - ${currentWeath.country}',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.7)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsets.all(padding),
              child: Image(image: AssetImage('images/$icon.png')),
            )),
      ],
    );
  }
}

// class MyClip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = size.width;
//     double h = size.height;

//     Path path = Path();
//     path.lineTo(0, h);
//     path.lineTo(w, h);
//     path.lineTo(w, h * 0.7);

//     path.quadraticBezierTo(w, h * 0.5, w * 0.7, h * 0.5);
//     path.lineTo(w * 0.7, h * 0.5);

//     path.quadraticBezierTo(w * 0.45, h * 0.5, w * 0.49, h * 0.25);
//     path.lineTo(w * 0.49, h * 0.25);
//     path.quadraticBezierTo(w * 0.5, 0, w * 0.35, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return false;
//   }
// }
