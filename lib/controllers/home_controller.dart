import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:transviti_test/core/services/dio_service.dart';
import 'package:transviti_test/models/trending_repos_model.dart';

class HomeController extends GetxController {
  var trendingRepos = TrendingRepos(items: []).obs;
  final DioService dioService = DioService();
  int currentPage = 1;
  RxBool isLoading = false.obs;
  final StreamController<TrendingRepos> _reposStreamController =
      StreamController<TrendingRepos>.broadcast();

  Stream<TrendingRepos> get reposStream => _reposStreamController.stream;

  // card extended on long press
  var isCardExtended = false.obs;

  void toggleCardExtension() {
    isCardExtended.value = !isCardExtended.value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

// fetch repos
  Future<void> fetchItems({bool loadMore = false}) async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      final response = await dioService.get(
        '/search/repositories',
        queryParameters: {
          'q': 'stars:>1000',
          'sort': 'stars',
          'order': 'desc',
          'per_page': 6,
          'page': loadMore ? currentPage + 1 : 1,
        },
      ).timeout(const Duration(seconds: 15), onTimeout: () {
        throw NetworkException('Request timed out');
      });

      TrendingRepos repos = TrendingRepos.fromJson(response);

      if (loadMore) {
        trendingRepos.value.items?.addAll(repos.items ?? []);
      } else {
        trendingRepos.value = TrendingRepos(items: [
          ...(trendingRepos.value.items ?? []),
          ...repos.items!,
        ]);
      }

      _reposStreamController.add(trendingRepos.value);

      if (repos.items?.isNotEmpty ?? false) {
        currentPage++;
      }
    } catch (e) {
      if (e is NetworkException) {
        debugPrint('Error: ${e.message}');
      } else {
        debugPrint('Unexpected error: $e');
      }
      _reposStreamController
          .addError('Failed to load data. Please check your connection.');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _reposStreamController.close();
    super.onClose();
  }
}
