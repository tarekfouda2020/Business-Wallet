import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/comp_favorite_model.dart';
import 'package:base_flutter/company/screens/company_home/tabs/company_favorite/CompanyFavoriteImports.dart';
import 'package:base_flutter/company/screens/company_home/tabs/company_favorite/tabs/favorite_map/widgets/FavoriteMapWidgetsImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/MapStyle.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/MarkerGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'FavoriteMap.dart';
part 'FavoriteMapData.dart';