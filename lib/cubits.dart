import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_app/cubit/survey_cubit.dart';
import 'package:survey_app/models/model.dart';
import 'package:survey_app/repository/api_repo.dart';
import 'package:survey_app/services/api_service.dart';

class Cubits {
  static final apiRepository = ApiRepository(apiService: ApiService());
  static List<BlocProvider> registerCubits() => [
        BlocProvider<SurveyCubit>(
          create: (context) => SurveyCubit(apiRepository),
        ),
        // BlocProvider<SurveyCubit>(
        // create: (context) => SurveyCubit(modelService!),
        //),
      ];
}
