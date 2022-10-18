// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) =>
    Welcome.fromJson(json.decode(str) as Map<String, dynamic>);

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.id,
    required this.startQuestionId,
    required this.questions,
    required this.strings,
  });

  dynamic id;
  dynamic startQuestionId;
  List<Question> questions;
  dynamic strings;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json['id'],
        startQuestionId: json['start_question_id'],
        questions: List<Question>.from(
          json['questions'].map(Question.fromJson) as List<Map<String, String>>,
        ),
        strings: json['strings'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'start_question_id': startQuestionId,
        'questions': List<dynamic>.from(questions.map((x) => x.toJson())),
        'strings': strings.toJson(),
      };
}

class Question {
  Question({
    this.id,
    this.questionType,
    this.answerType,
    this.questionText,
    required this.options,
    this.next,
  });

  dynamic id;
  dynamic questionType;
  dynamic answerType;
  dynamic questionText;
  List<Option> options = [];
  dynamic next;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        questionType: json['question_type'],
        answerType: json['answer_type'],
        questionText: json['question_text'],
        options:
            List<Option>.from(json['options'].map(Option.fromJson) as List),
        next: json['next'] == null ? null : json['next'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'question_type': questionType,
        'answer_type': answerType,
        'question_text': questionText,
        'options': List<dynamic>.from(options.map((x) => x.toJson())),
        'next': next == null ? null : next,
      };
}

class Option {
  Option({
    required this.value,
    required this.displayText,
  });

  dynamic value;
  dynamic displayText;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        value: json['value'],
        displayText: json['display_text'],
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'display_text': displayText,
      };
}

class Strings {
  Strings({
    required this.en,
  });

  En en;

  factory Strings.fromJson(Map<String, String> json) => Strings(
        en: En.fromJson(json['en'] as Map<String, String>),
      );

  Map<String, dynamic> toJson() => {
        'en': en.toJson(),
      };
}

class En {
  En({
    required this.qFarmerName,
    required this.qFarmerGender,
    required this.optMale,
    required this.optFemale,
    required this.optOther,
    required this.qSizeOfFarm,
  });

  dynamic qFarmerName;
  dynamic qFarmerGender;
  dynamic optMale;
  dynamic optFemale;
  dynamic optOther;
  dynamic qSizeOfFarm;

  factory En.fromJson(Map<String, String> json) => En(
        qFarmerName: json['q_farmer_name'],
        qFarmerGender: json['q_farmer_gender'],
        optMale: json['opt_male'],
        optFemale: json['opt_female'],
        optOther: json['opt_other'],
        qSizeOfFarm: json['q_size_of_farm'],
      );

  Map<String, dynamic> toJson() => {
        'q_farmer_name': qFarmerName,
        'q_farmer_gender': qFarmerGender,
        'opt_male': optMale,
        'opt_female': optFemale,
        'opt_other': optOther,
        'q_size_of_farm': qSizeOfFarm,
      };
}
