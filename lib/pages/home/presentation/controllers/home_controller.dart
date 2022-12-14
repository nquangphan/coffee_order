import 'package:get/get.dart';

import '../../domain/adapters/repository_adapter.dart';
import '../../domain/entity/cases_model.dart';

class HomeController extends GetxController {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;

  @override
  void onInit() {
    super.onInit();
    //Loading, Success, Error handle with 1 line of code
    homeRepository.getCases;
  }

  Country getCountryById(String id) {
    return Country(
        id: id,
        country: 'country',
        countryCode: 'countryCode',
        slug: 'slug',
        newConfirmed: 1,
        totalConfirmed: 1,
        newDeaths: 1,
        totalDeaths: 1,
        newRecovered: 1,
        totalRecovered: 1,
        date: DateTime.now(),
        premium: Premium());
  }
}
