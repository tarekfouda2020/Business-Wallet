import 'dart:convert';
import 'dart:io';
import 'package:base_flutter/company/models/dots/LocationModel.dart';
import 'package:base_flutter/company/screens/location_address/LocationAddressImports.dart';
import 'package:base_flutter/company/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/models/Dots/WelcomeModel.dart';
import 'package:base_flutter/general/models/intro_model.dart';
import 'package:base_flutter/general/models/user_model.dart';
import 'package:base_flutter/general/resources/GeneralRepository.dart';
import 'package:base_flutter/general/screens/customer_welcome/CustomerWelcomeImports.dart';
import 'package:base_flutter/res.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:base_flutter/general/constants/GlobalState.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'utils.dart';

