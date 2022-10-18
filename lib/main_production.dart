// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_app/app/app.dart';
import 'package:survey_app/bootstrap.dart';
import 'package:survey_app/cubit/survey_cubit.dart';
import 'package:survey_app/cubits.dart';
import 'package:survey_app/models/model.dart';

void main() {
  bootstrap(
    () => MultiBlocProvider(
      providers: Cubits.registerCubits(),
      child: App(),
    ),
  );
}
