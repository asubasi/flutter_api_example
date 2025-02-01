import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_api_example/src/core/network/network_exception.dart';
import 'package:flutter_api_example/src/data/data_source/country_data_source.dart';
import 'package:flutter_api_example/src/data/model/country_model.dart';

abstract class CountryRepository {
  Future<Either<NetworkExceptions, List<CountryModel>>> getCountries();
}

class CountryRepositoryImpl extends CountryRepository {
  final CountryDataSource countryDataSource;

  CountryRepositoryImpl(this.countryDataSource);

  @override
  Future<Either<NetworkExceptions, List<CountryModel>>> getCountries() async {
    try {
      final countries = await countryDataSource.getCountries();
      return Right(countries);
    } on DioException catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }
}


// Dio
// DataSource
// Repository
// Cubit
// Page