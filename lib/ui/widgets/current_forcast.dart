import 'package:flutter/material.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/models/current.dart';

class CurrentForcast extends StatelessWidget {
  final CurrentWeatherModel currentWeath;
  final int icon;
  const CurrentForcast(this.currentWeath, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.blue),
      child: Stack(
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
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                      Text(
                        '${currentWeath.tempF.toInt()}°F',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                  Text(
                    currentWeath.condtionText,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Theme.of(context).primaryColor),
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
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Text(
                        '${currentWeath.localTime} - ${currentWeath.country}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.7)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: AlignmentDirectional.topEnd,
              child: Image(image: AssetImage('images/$icon.png'))),
        ],
      ),
    );
  }
}

// class MyClip extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.quadraticBezierTo(size.width / 3, 0, size.width / 3, size.height / 3);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper oldClipper) {
//     return true;
//   }
// }
