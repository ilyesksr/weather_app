import 'package:flutter/material.dart';
import 'package:weather_app/services/search_for_city.dart';

class SearchCityTextField extends StatelessWidget {
  const SearchCityTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: Search());
      },
      child: const TextField(
        decoration: InputDecoration(
            hintText: 'Search for your city name',
            suffixIcon: Icon(Icons.search_rounded)),
        enabled: false,
      ),
    );
  }
}
