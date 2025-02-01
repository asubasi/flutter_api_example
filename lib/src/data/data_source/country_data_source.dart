import 'package:dio/dio.dart';
import 'package:flutter_api_example/src/core/constant/url_constant.dart';
import 'package:flutter_api_example/src/core/network/network_manager.dart';
import 'package:flutter_api_example/src/data/model/country_model.dart';

abstract class CountryDataSource {
  Future<List<CountryModel>> getCountries();
}

class CountryDataSourceImpl extends CountryDataSource {
  final NetworkManager networkManager;

  CountryDataSourceImpl(this.networkManager);

  @override
  Future<List<CountryModel>> getCountries() async {
    try {
      final response = await networkManager.get(UrlConstant.allCountries);
      return (response.data as List).map((x) => CountryModel.fromJson(x)).toList();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
