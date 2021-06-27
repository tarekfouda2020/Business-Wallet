import 'dart:async';

import 'package:base_flutter/company/models/comp_fav_details_model.dart';
import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:base_flutter/company/screens/company_fav_details/widgets/CompFavDetailsWidgetsImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'CompanyFavDetails.dart';
part 'CompanyFavDetailsData.dart';