import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/localization/localization_bloc.dart';
import 'src/screens/home_screen.dart';

// https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/edit#

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlocProvider<LanguageBloc>(
      create: (_) => LanguageBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, Locale>(
      builder: (BuildContext context, Locale state) {
        return MaterialApp(
          title: 'Sample Localization',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
