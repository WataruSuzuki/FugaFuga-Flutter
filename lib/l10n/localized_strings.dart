import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class LocalizedStrings {
    static Future<LocalizedStrings> load(Locale locale) {
        final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
        final String localeName = Intl.canonicalizedLocale(name);

        return initializeMessages(localeName).then((_) {
            Intl.defaultLocale = localeName;
            return LocalizedStrings();
        });
    }

    static LocalizedStrings of(BuildContext context) {
        return Localizations.of<LocalizedStrings>(context, LocalizedStrings);
    }

    static final LocalizedStrings instance = new LocalizedStrings();

    // TODO 追加すべき文言
    String get title => Intl.message('Flutter Demo Home Page', name: "title");
    String get message => Intl.message('You have pushed the button this many times:', name: "message");
}