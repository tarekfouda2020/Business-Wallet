import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/answer_model.dart';
import 'package:base_flutter/customer/models/investment_ads_details_model.dart';
import 'package:base_flutter/customer/models/kayan_owner_model.dart';
import 'package:base_flutter/customer/models/question_model.dart';
import 'package:base_flutter/customer/screens/favorite_details/FavoriteDetailsImports.dart';
import 'package:base_flutter/customer/screens/invitation_details/widgets/InvDetailsWidgetsImports.dart';
import 'package:base_flutter/customer/screens/provider_details/widgets/ProviderDetailsWidgetsImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

part 'BuildDescription.dart';

part 'BuildAdsOwner.dart';

part 'BuildAnswerItem.dart';

part 'BuildQuestionItem.dart';
part 'BuildQuestionList.dart';
