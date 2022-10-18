import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:survey_app/models/model.dart';
import 'package:survey_app/repository/api_repo.dart';
import 'package:survey_app/services/api_service.dart';

part 'survey_state.dart';
part 'survey_cubit.freezed.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit(this.apiRepository) : super(const SurveyState.initial());

  ApiRepository apiRepository;

  Future getQuestion() async {
    log('called');
    emit(const _Loading());
    log(const SurveyState.loading().toString());
    try {
      final questionList =
          await apiRepository.getQuestionList() as List<Question>?;
      emit(const SurveyState.loaded());
      return questionList;
    } catch (_) {
      emit(const SurveyState.error());
    }
    return Question(options: []);
  }
}
