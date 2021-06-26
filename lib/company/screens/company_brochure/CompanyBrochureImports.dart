import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/company/models/dots/AddBrochureServiceModel.dart';
import 'package:base_flutter/company/models/dots/SendBrochureModel.dart';
import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:base_flutter/company/screens/company_barcode/CompanyBarcodeImports.dart';
import 'package:base_flutter/company/screens/company_brochure/widgets/CompBrochureWidgetsImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/CustomButtonAnimation.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/DefaultButton.dart';
import 'package:base_flutter/general/widgets/LoadingButton.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'CompanyBrochure.dart';

part 'CompanyBrochureData.dart';
