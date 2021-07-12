import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/cost_subscribe_model.dart';
import 'package:base_flutter/company/models/dots/AddOpinionQuestionsModel.dart';
import 'package:base_flutter/company/models/dots/AddOpinionSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/company/models/extra_cost_model.dart';
import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:base_flutter/company/screens/company_opinion_subscribe/tabs/first_step_opinion/FirstStepOpinionImports.dart';
import 'package:base_flutter/company/screens/company_opinion_subscribe/tabs/fourth_step_opinion/FourthStepOpinionImports.dart';
import 'package:base_flutter/company/screens/company_opinion_subscribe/tabs/second_step_opinion/SecondStepOpinionImports.dart';
import 'package:base_flutter/company/screens/company_opinion_subscribe/tabs/second_step_opinion/widgets/SecStepOpinionWidgetsImports.dart';
import 'package:base_flutter/company/screens/company_opinion_subscribe/tabs/third_step_opinion/ThirdStepOpinionImports.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/CustomButtonAnimation.dart';
import 'package:base_flutter/general/constants/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/ModaLs/ModalHelper.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/AdaptivePicker.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'CompOpinionSubscribe.dart';
part 'CompOpinionSubscribeData.dart';
