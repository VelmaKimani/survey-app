// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:survey_app/cubit/survey_cubit.dart';
import 'package:survey_app/models/model.dart';
import 'package:survey_app/repository/api_repo.dart';

class FirstPage extends StatefulWidget {
  FirstPage();

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late ApiRepository apiRepository;

/*   @override
  void initState() {
    super.initState();

    context.read<SurveyCubit>().getQuestion();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Survey Questions'),
        ),
        body: Container(
          child: BlocBuilder<SurveyCubit, SurveyState>(
            builder: (context, state) {
              if (const SurveyState.loading() == true) {
                return const CircularProgressIndicator();
              } else if (const SurveyState.error() == true) {
                return const Text("Unexpected failure");
              } else if (const SurveyState.loaded() == true) {
                final questionList = state.questionList;
                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: questionList.length,
                  itemBuilder: (context, index) {
                    final oneQuiz = questionList[1];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            oneQuiz.id.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            oneQuiz.questionType.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            oneQuiz.questionText.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            oneQuiz.options.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('NEXT'),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
/* Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        ]Padding(
            padding: const EdgeInsets.all(10),
            child: BlocProvider(
              create: (_) => SurveyCubit(apiRepository),
              child: Text(
                'Quiz one ${widget.question}',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Quiz one ${widget.question.options[1]}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Quiz one ${widget.question.options[2]}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Quiz one ${widget.question.options[3]}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),*/