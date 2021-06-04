import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/customer/screens/Home/HomeImports.dart';
import 'package:base_flutter/customer/screens/Home/tabs/favorites/FavoritesImports.dart';
import 'package:base_flutter/customer/screens/Home/tabs/followers/FollowersImports.dart';
import 'package:base_flutter/customer/screens/Home/tabs/invitations/InvitationsImports.dart';
import 'package:base_flutter/customer/screens/Home/tabs/profile/ProfileImports.dart';
import 'package:base_flutter/customer/screens/Home/tabs/switch_page/SwitchPageImports.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';

part 'BuildFloatingButton.dart';
part 'BuildTabBarPages.dart';
part 'BuildMainHeader.dart';
part 'BuildHeaderdrop.dart';
part 'HomeScaffold.dart';
part 'BuildTabBarItem.dart';
part 'BuildTabBarBody.dart';