import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/CustomButtonAnimation.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/utils_functions/DynamicLinkService.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/DetailsWidgetsImports.dart';

part 'CompanyMainDetails.dart';
part 'CompanyMainDetailsData.dart';
