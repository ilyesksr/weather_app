import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/current.dart';
import 'package:weather_app/models/forcast.dart';
import 'package:weather_app/models/suggestion.dart';
import 'package:weather_app/provider/forcast_provider.dart';
import 'package:weather_app/services/forcast.dart';
import 'package:weather_app/ui/widgets/noconnection.dart';

class Search extends SearchDelegate {
  ForcastWeather weather = ForcastWeather();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close_rounded),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Stream<List<SuggestionWeatherModel>?> suggestionList =
        Stream.fromFuture(weather.getWeatherSuggestions(query));
    return StreamBuilder(
      stream: suggestionList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                        '${snapshot.data![index].name}, ${snapshot.data![index].region}'),
                    trailing: Text(snapshot.data![index].country),
                    onTap: () async {
                      String queryy = snapshot.data![index].name;
                      ({
                        CurrentWeatherModel? currenDay,
                        ForcastWeatherModel? nextDay,
                        ForcastWeatherModel? thirdDay
                      }) dayForcasts = (
                        currenDay:
                            await weather.getCurrentWeatherResponse(queryy),
                        nextDay: await weather.getWeatherForcast(
                            query: queryy, dayIndex: 1),
                        thirdDay: await weather.getWeatherForcast(
                            query: queryy, dayIndex: 2)
                      );

                      context.read<Forcast>().setForcastDays = dayForcasts;
                      close(context, null);
                    },
                  ));
        }

        return const NoConnection();
      },
    );
  }
}
