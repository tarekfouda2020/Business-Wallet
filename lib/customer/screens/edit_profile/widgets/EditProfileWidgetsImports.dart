

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/Dtos/EducationModel.dart';
import 'package:base_flutter/customer/models/Dtos/FamilyMemberModel.dart';
import 'package:base_flutter/customer/models/Dtos/GenderModel.dart';
import 'package:base_flutter/customer/models/Dtos/IncomeModel.dart';
import 'package:base_flutter/customer/models/Dtos/LivingModel.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/customer/screens/edit_profile/EditProfileImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/constants/Inputs/IconTextFiled.dart';
import 'package:base_flutter/general/constants/Inputs/InkWellTextField.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/ModaLs/DownBottomSheet.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/DefaultButton.dart';
import 'package:base_flutter/general/widgets/LoadingButton.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/MyText.dart';
import '../../../../res.dart';

part 'BuildEditProfilePageView.dart';
part 'BuildEditProfileHeader.dart';
part 'BuildEditProfilePhoto.dart';
part 'BuildEditProfileFormInputs.dart';
part 'BuildEditProfileButton.dart';