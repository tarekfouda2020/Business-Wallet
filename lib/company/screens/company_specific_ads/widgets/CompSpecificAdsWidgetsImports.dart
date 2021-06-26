import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/screens/company_specific_ads/CompSpecificAdsImports.dart';
import 'package:base_flutter/company/widgets/BuildDropItem.dart';
import 'package:base_flutter/customer/models/ads_details_model.dart';
import 'package:base_flutter/customer/models/comment_model.dart';
import 'package:base_flutter/customer/models/kayan_owner_model.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/DefaultButton.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';

part 'BuildAdsInfo.dart';

part 'BuildAdsDescription.dart';

part 'BuildFile.dart';

part 'BuildSwiperView.dart';

part 'BuildVideoView.dart';

part 'BuildOwnerAds.dart';

part 'BuildAdsComments.dart';

part 'BuildAddRate.dart';

part 'BuildAddComments.dart';
