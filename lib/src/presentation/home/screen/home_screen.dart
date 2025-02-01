import 'package:flutter/material.dart';
import 'package:flutter_api_example/src/presentation/home/cubit/countries/countries_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CountriesCubit>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CountriesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen'),
          ),
          body: switch (state) {
            CountriesLoading _ => const Center(child: CircularProgressIndicator.adaptive()),
            CountriesLoaded data => ListView.builder(
                itemCount: data.countries.length,
                itemBuilder: (context, index) {
                  final Color color = index.isEven ? const Color.fromARGB(255, 221, 221, 221) : Colors.white;
                  final country = data.countries[index];
                  return ListTile(
                    tileColor: color,
                    style: ListTileStyle.list,
                    title: Text(country.name!.common.toString()),
                    leading: Text(
                      country.flag.toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            _ => Container(),
          },
        );
      },
    );
  }
}
