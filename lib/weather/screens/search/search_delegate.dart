import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/weather/controllers/search_controller.dart';
import 'package:skycast/weather/screens/search/search_results.dart';
import 'package:skycast/weather/screens/search/widgets/suggestion_tile.dart';

class SearchInSkyCast extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    WeatherSearchController.resetVariables();

    int firstCommaIndex = query.indexOf(',');

    String cityName = query.substring(0, firstCommaIndex).trim();

    String cityInfo = query.substring(firstCommaIndex + 1).trim();

    WeatherSearchController.query = cityInfo;
    query = cityName;

    return const SearchResultScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      // Call SearchCities
      WeatherSearchController.getSearchCities(query);

      return Obx(() {
        if (WeatherSearchController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: WeatherSearchController.locationsList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    query =
                        '${WeatherSearchController.locationsList[index].name}, ${WeatherSearchController.locationsList[index].lat}, ${WeatherSearchController.locationsList[index].lon}';

                    showResults(context);
                  },
                  child: SuggestionTile(
                      location: WeatherSearchController.locationsList[index]));
            },
          );
        }
      });
    }
  }
}
