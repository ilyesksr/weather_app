import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/provider/forcast_provider.dart';
import 'package:weather_app/ui/widgets/current_forcast.dart';
import 'package:weather_app/ui/widgets/noconnection.dart';
import 'package:weather_app/ui/widgets/other_days_forcast.dart';
import 'package:weather_app/ui/widgets/search_city_text_field.dart';
import 'package:weather_app/utils/get_weather_icon.dart';

import '../../models/current.dart';
import '../../models/forcast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(margine),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text('Weather Forcast',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineLarge
                    //    ?.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
              ),
              const SizedBox(
                height: padding,
              ),
              const SearchCityTextField(),
              const SizedBox(
                height: padding,
              ),
              Selector<
                      Forcast,
                      ({
                        CurrentWeatherModel? currenDay,
                        ForcastWeatherModel? nextDay,
                        ForcastWeatherModel? nnextDay
                      })?>(
                  selector: (ctx, forcastProvider) =>
                      forcastProvider.forcastDays,
                  builder: (context, forcast, _) {
                    return forcast != null
                        ? FutureBuilder(
                            future: getIconFromCode(forcast.currenDay!.code,
                                forcast.nextDay!.code, forcast.nnextDay!.code),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                              if (snapshot.hasData) {
                                return ListView(shrinkWrap: true, children: [
                                  CurrentForcast(forcast.currenDay!,
                                      snapshot.data?.icon1 ?? 113),
                                  OtherDaysForcast(forcast.nextDay!,
                                      snapshot.data?.icon2 ?? 113),
                                  OtherDaysForcast(forcast.nnextDay!,
                                      snapshot.data?.icon3 ?? 113),
                                ]);
                              }
                              if (snapshot.hasError) {
                                return const Center(
                                  child: Text('Error occured!'),
                                );
                              }
                              return const SizedBox();
                            },
                          )
                        : const NoConnection();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
