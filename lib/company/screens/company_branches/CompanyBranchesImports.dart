import 'package:base_flutter/company/models/branch_model.dart';
import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:base_flutter/company/screens/company_branches/branches_cubit/branches_cubit.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/CompanyBranchesWidgetImports.dart';

part 'CompanyBranches.dart';
part 'CompanyBranchesData.dart';