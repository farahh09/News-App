import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/core/internet_checker.dart';
import 'package:news/core/observer.dart';
import 'package:news/core/theming/bloc/cubit.dart';
import 'package:news/screens/home_screen.dart';
import 'core/theming/bloc/states.dart';
import 'di.dart';
import 'models/ArticlesAdapter.dart';
import 'models/NewsResponseAdapter.dart';
import 'models/SourcesAdapter.dart';
import 'models/SourcesResponseAdapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SourcesAdapter());
  Hive.registerAdapter(SourcesResponseAdapter());
  Hive.registerAdapter(NewsResponseAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  configureDependencies();
  getIt<InternetConnectivity>().initialize();
  runApp(
    BlocProvider(
      create: (context) => getIt<ThemingCubit>(),
      child: BlocBuilder<ThemingCubit, ThemingStates>(
        builder: (BuildContext context, state) {
          return EasyLocalization(
            supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
            fallbackLocale: Locale('en', 'US'),
            path: 'assets/translations',
            child: MyApp(),
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
    );
  }
}
