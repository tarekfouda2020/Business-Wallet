import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/dots/LocationModel.dart';
import 'package:base_flutter/company/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/company/screens/location_address/widgets/LocationWidgetsImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/widgets/MyText.dart';

part 'LocationAddress.dart';

part 'LocationAddressData.dart';
