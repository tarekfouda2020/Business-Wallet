import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/Dtos/GenderModel.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/customer/screens/register/RegisterImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/constants/Inputs/IconTextFiled.dart';
import 'package:base_flutter/general/constants/Inputs/InkWellTextField.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/ModaLs/DownBottomSheet.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/intro_model.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:base_flutter/general/widgets/LoadingButton.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'BuildRegisterInputs.dart';
part 'BuildCheckTerms.dart';
part 'BuildButton.dart';
part 'BuildHaveAccount.dart';