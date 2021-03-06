import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/dots/AddBranchModel.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:base_flutter/company/screens/company_branches/branches_cubit/branches_cubit.dart';
import 'package:base_flutter/company/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/CustomButtonAnimation.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/utils_functions/AdaptivePicker.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/LoadingButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'widgets/AddBranchImports.dart';


part 'AddBranch.dart';
part 'AddBranchData.dart';