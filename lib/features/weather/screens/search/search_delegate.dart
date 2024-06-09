import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/features/weather/controllers/search_controller.dart';
import 'package:skycast/features/weather/screens/search/search_results.dart';
import 'package:skycast/features/weather/screens/search/widgets/suggestion_tile.dart';

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
    return SearchResultScreen(
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      final WeatherSearchController controller =
          Get.put(WeatherSearchController(), permanent: false);

      // Call SearchCities
      controller.getSearchCities(query);

      return Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.locationsList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    query =
                        '${controller.locationsList[index].lat}, ${controller.locationsList[index].lon}';

                    showResults(context);
                  },
                  child: SuggestionTile(
                      location: controller.locationsList[index]));
            },
          );
        }
      });
    }
  }
}
