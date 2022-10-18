// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:survey_app/counter/counter.dart';
import 'package:survey_app/cubit/survey_cubit.dart';
import 'package:survey_app/l10n/l10n.dart';
import 'package:survey_app/repository/api_repo.dart';
import 'package:survey_app/routes.dart';

import '../../counter/view/first_page.dart';
import '../../models/model.dart';
import '../../services/api_service.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  final apiRepository = ApiRepository(apiService: ApiService());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      //home: const CounterPage(),
      initialRoute: AllRoutes.firstPage,
      /* onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('unknown'),
            ),
          ),
        ), */
      onGenerateRoute: AllRoutes.generateRoute,

      // onGenerateInitialRoutes: (initialRoute) => AllRoutes.firstPage,
    );
  }
}
