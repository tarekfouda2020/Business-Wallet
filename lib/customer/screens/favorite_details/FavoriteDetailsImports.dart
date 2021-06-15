import 'dart:convert';

import 'package:base_flutter/customer/models/answer_model.dart';
import 'package:base_flutter/customer/models/investment_ads_model.dart';
import 'package:base_flutter/customer/models/question_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/customer/screens/favorite_details/widgets/FavoriteDetailsWidgetsImports.dart';
import 'package:base_flutter/customer/screens/invitation_details/widgets/InvDetailsWidgetsImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/CustomButtonAnimation.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/DefaultButton.dart';
import 'package:base_flutter/general/widgets/LoadingButton.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'FavoriteDetails.dart';
part 'FavoriteDetailsData.dart';