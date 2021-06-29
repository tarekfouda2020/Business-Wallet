import 'dart:io';

import 'package:base_flutter/company/models/dots/AddOpinionQuestionsModel.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/screens/company_opinion_subscribe/CompOpinionSubscribeImports.dart';
import 'package:base_flutter/company/screens/company_opinion_subscribe/tabs/first_step_opinion/FirstStepOpinionImports.dart';
import 'package:base_flutter/company/widgets/BuildFormText.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/constants/Inputs/InkWellTextField.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/Inputs/RichTextFiled.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

part 'BuildOpinionForm.dart';

part 'BuildOpinionImages.dart';

part 'BuildOpinionQuestions.dart';

part 'BuildOpinionVideos.dart';
part 'BuildQuestionItem.dart';
part 'BuildAnswerItem.dart';