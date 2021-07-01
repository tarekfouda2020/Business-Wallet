import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/MapStyle.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/MarkerGenerator.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/MapScreenWidgetImports.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../MainPageImports.dart';


part 'MapScreen.dart';
part 'MapScreenData.dart';