import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/dots/DurationModel.dart';
import 'package:base_flutter/company/models/dots/GenderModel.dart';
import 'package:base_flutter/company/models/dots/SelectedInterestModel.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:base_flutter/company/screens/company_subscribe/CompanySubscribeImports.dart';
import 'package:base_flutter/company/widgets/BuildFormText.dart';
import 'package:base_flutter/customer/models/Dtos/AgeModel.dart';
import 'package:base_flutter/customer/models/Dtos/EducationModel.dart';
import 'package:base_flutter/customer/models/Dtos/FamilyMemberModel.dart';
import 'package:base_flutter/customer/models/Dtos/IncomeModel.dart';
import 'package:base_flutter/customer/models/Dtos/LivingModel.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/constants/Inputs/InkWellTextField.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/ModaLs/DownBottomSheet.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/ModaLs/ModalHelper.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:base_flutter/company/screens/company_subscribe/tabs/second_step/SecondStepImports.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

part 'BuildPrice.dart';

part 'BuildAdsValue.dart';

part 'BuildSecForm.dart';

part 'BuildShowInterestDialog.dart';