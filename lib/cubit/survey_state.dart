part of 'survey_cubit.dart';

@freezed
class SurveyState with _$SurveyState {
  const SurveyState({required this.questionList});

  const factory SurveyState.error() = _Error;

  const factory SurveyState.initial() = _Initial;

  const factory SurveyState.loading() = _Loading;

  const factory SurveyState.loaded() = _Loaded;
  final List<Question> questionList;
}
