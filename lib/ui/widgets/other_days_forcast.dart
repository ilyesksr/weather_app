import 'package:flutter/material.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/models/forcast.dart';

class OtherDaysForcast extends StatelessWidget {
  final ForcastWeatherModel weather;
  final int icon;
  const OtherDaysForcast(this.weather, this.icon, {super.key});

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
                  Text(
                    weather.condtionText,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: padding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Max Temp : ${weather.maxTempC.toInt()}°C / ${weather.maxTempF.toInt()}°F',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            'Min Temp : ${weather.minTempC.toInt()}°C / ${weather.minTempF.toInt()}°F',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            'Avg Temp : ${weather.avgTempC.toInt()}°C / ${weather.avgTempF.toInt()}°F',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weather.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            weather.region,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: padding,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Expanded(
                      //   child: Text(
                      //     '${weather.name}, ${weather.region}',
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .titleMedium
                      //         ?.copyWith(color: Theme.of(context).primaryColor),
                      //   ),
                      // ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sunrise : ${weather.sunriseTime}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              'Sunset : ${weather.sunsetTime}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        '${weather.dayDate} - ${weather.country}',
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
