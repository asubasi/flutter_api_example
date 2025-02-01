import 'package:dio/dio.dart';
import 'package:flutter_api_example/src/core/network/network_manager.dart';
import 'package:flutter_api_example/src/data/data_source/country_data_source.dart';
import 'package:flutter_api_example/src/data/repository/country_repository.dart';
import 'package:flutter_api_example/src/presentation/home/cubit/countries/countries_cubit.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initialize() async {
  injector.registerLazySingleton(() => Dio());
  injector.registerLazySingleton(() => NetworkManager(injector()));
  injector.registerLazySingleton<CountryDataSource>(() => CountryDataSourceImpl(injector()));
  injector.registerLazySingleton<CountryRepository>(() => CountryRepositoryImpl(injector()));
  injector.registerLazySingleton(() => CountriesCubit(injector()));
}
