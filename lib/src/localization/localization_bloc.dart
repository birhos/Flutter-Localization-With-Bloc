import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../enums/language.dart';

class LanguageBloc extends Cubit<Locale> {
  LanguageBloc() : super(Language.TR.xGetLocale);

  void updateLocale(Language value) {
    emit(value.xGetLocale);
  }
}
