import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:survey_app/counter/view/first_page.dart';
import 'package:survey_app/models/model.dart';

import 'counter/view/second_page.dart';

class AllRoutes {
  static const String firstPage = '/firstPage';
  static const String secondPage = '/secondPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    /*  final List<Option> allOptions = [];

    final optionchoice = allOptions.map(
      (e) => {'value': e.value, 'displayText': e.displayText},
    );
    var questionList;
    final question = Question(
      id: questionList.id,
      questionType: questionList.questionType,
      answerType: questionList.answerType,
      questionText: questionList.questionText,
      options: allOptions,
      next: questionList.next,
    ); */

    switch (settings.name) {
      case firstPage:
        return _route(
          FirstPage(),
        );
      case secondPage:
        return _route(
          const SecondPage(),
        );

      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: const Text('Wrong'),
            ),
            body: const Center(
              child: Text('Wrong page'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _route(Widget page, {bool fullscreen = false}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => page,
      fullscreenDialog: fullscreen,
    );
  }
}
