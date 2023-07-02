import 'package:flutter/material.dart';
import 'package:weather_app/constant.dart';

import '../../services/search_for_city.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(margine),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Weather Forcast',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(
                height: padding,
              ),
              TextField(
                decoration: const InputDecoration(
                    hintText:
                        'Search for your city name, zipcode, postcode, ip ...',
                    suffixIcon: Icon(Icons.search_rounded)),
                onTap: () {
                  showSearch(context: context, delegate: Search());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
