
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/dots/GenderModel.dart';
import 'package:base_flutter/customer/models/Dtos/EducationModel.dart';
import 'package:base_flutter/customer/models/Dtos/FamilyMemberModel.dart';
import 'package:base_flutter/customer/models/Dtos/IncomeModel.dart';
import 'package:base_flutter/customer/models/Dtos/LivingModel.dart';
import 'package:base_flutter/customer/models/Dtos/UpdateCustomerModel.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/customer/screens/edit_profile/widgets/EditProfileWidgetsImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/CustomButtonAnimation.dart';
import 'package:base_flutter/general/constants/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/utils_functions/AdaptivePicker.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'EditProfile.dart';
part 'EditProfileData.dart';