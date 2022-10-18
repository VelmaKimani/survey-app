// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:survey_app/models/model.dart';
import 'package:survey_app/services/api_service.dart';

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });
  final ApiService apiService;
  Future<Object?> getQuestionList() async {
    final response = await apiService.getQuestion();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (oneQuiz) => Question.fromJson,
          )
          .toList();
    }
    return response;
  }
}
