import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/screens/company_edit_profile/CompanyEditProfileImports.dart';
import 'package:base_flutter/company/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/company/widgets/BuildDropItem.dart';
import 'package:base_flutter/company/widgets/BuildFormText.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/constants/Inputs/IconTextFiled.dart';
import 'package:base_flutter/general/constants/Inputs/InkWellTextField.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/Inputs/RichTextFiled.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

part 'BuildSocialDrop.dart';

part 'BuildProfileInfo.dart';

part 'BuildPartnerDrop.dart';

part 'BuildMainDrop.dart';

part 'BuildInterestDrop.dart';

part 'BuildEditText.dart';

part 'BuildDescDrop.dart';

part 'BuildCompInfoDrop.dart';

part 'BuildCertificateDrop.dart';

part 'BuildBranchDrop.dart';

part 'BuildAddFileDrop.dart';

part 'BuildAddImageDrop.dart';

part 'BuildRadioItem.dart';

part 'BuildShowDropItem.dart';

part 'BuildCheckItem.dart';

part 'BuildCertificateItem.dart';