import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_api_example/src/data/model/country_model.dart';
import 'package:flutter_api_example/src/data/repository/country_repository.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final CountryRepository repository;
  CountriesCubit(this.repository) : super(CountriesInitial());

  Future<void> getCountries() async {
    emit(CountriesLoading());

    final result = await repository.getCountries();
    result.fold(
      (error) => emit(CountriesError(error.message)),
      (countries) => emit(CountriesLoaded(countries)),
    );
  }
}
