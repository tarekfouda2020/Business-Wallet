import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/customer/screens/invitation_details/widgets/InvDetailsWidgetsImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

part 'InvitationDetails.dart';
part 'InvitationDetailsData.dart';