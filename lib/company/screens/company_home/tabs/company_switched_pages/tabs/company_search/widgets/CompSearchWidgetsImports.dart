import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:base_flutter/company/screens/company_home/tabs/company_switched_pages/tabs/company_search/CompanySearchImports.dart';
import 'package:base_flutter/company/widgets/BuildHeaderDrop.dart';
import 'package:base_flutter/company/widgets/BuildTopHeader.dart';
import 'package:base_flutter/customer/models/Dtos/FilterModel.dart';
import 'package:base_flutter/customer/models/Dtos/field_drop_down_model.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/AutoCompleteField.dart';
import 'package:base_flutter/general/constants/Inputs/FutureBottomSheet.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'BuildSearchText.dart';

part 'BuildTabView.dart';

part 'BuildSelectedTabView.dart';
