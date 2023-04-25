import 'package:flutter/material.dart';

enum Language {
  TR,
  EN,
  HI,
  GU,
}

extension LanguageExtension on Language {
  Locale get xGetLocale {
    switch (this) {
      case Language.TR:
        return Locale("tr", "TR");

      case Language.EN:
        return Locale("en", "US");

      case Language.HI:
        return Locale("hi", "HI");

      case Language.GU:
        return Locale("gu", "GU");
    }
  }
}
