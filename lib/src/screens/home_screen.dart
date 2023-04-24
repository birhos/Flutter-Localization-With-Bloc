import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../enums/language.dart';
import '../localization/localization_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.localeName),
        actions: <Widget>[
          _buildButton('TR', Language.TR),
          _buildButton('EN', Language.EN),
          _buildButton('HI', Language.HI),
          _buildButton('GU', Language.GU),
        ],
      ),

      //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
            Text(AppLocalizations.of(context)!.helloWorld),

            //
            Localizations.override(
              context: context,
              locale: Language.EN.xGetLocale,
              child: Builder(
                builder: (BuildContext context) {
                  return Text(
                    AppLocalizations.of(context)!.helloWorld,
                  );
                },
              ),
            ),

            //
            Text(
              AppLocalizations.of(context)!.greeting("Hello", "World"),
            ),

            //
            Text(
              AppLocalizations.of(context)!.numberOfDataPoints(1200000),
            ),

            //
            Text(
              AppLocalizations.of(context)!
                  .helloWorldOn(DateTime.utc(1997, 04, 01)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title, Language language) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
        ),
        child: Text(
          title,
        ),
        onPressed: () {
          BlocProvider.of<LanguageBloc>(context).add(language);
        },
      ),
    );
  }
}
