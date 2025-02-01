import 'package:flutter/material.dart';
import 'package:flutter_api_example/src/presentation/home/cubit/countries/countries_cubit.dart';
import 'package:flutter_api_example/src/presentation/home/screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './src/injector.dart' as di;

void main() async {
  await di.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.injector<CountriesCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
