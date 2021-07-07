import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/screens/company_main_details/CompanyMainDetailsImports.dart';
import 'package:base_flutter/company/widgets/BuildContactItem.dart';
import 'package:base_flutter/company/widgets/BuildDropItem.dart';
import 'package:base_flutter/company/widgets/BuildImageMap.dart';
import 'package:base_flutter/customer/models/comment_model.dart';
import 'package:base_flutter/customer/models/details_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/Inputs/RichTextFiled.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/DefaultButton.dart';
import 'package:base_flutter/general/widgets/LoadingButton.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:map/map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';


part 'BuildRateCompany.dart';

part 'BuildProductImg.dart';

part 'BuildProductDetails.dart';

part 'BuildContactDrop.dart';

part 'BuildCommentsDrop.dart';

part 'BuildImgDrop.dart';

part 'BuildSocialDrop.dart';

part 'BuildContactData.dart';

part 'BuildImagesData.dart';

part 'BuildCommentItem.dart';

part 'BuildCommentButton.dart';
part 'BuildShowDescription.dart';
part 'BuildSocialItem.dart';
part 'BuildShowAccreditation.dart';
part 'BuildShowPartner.dart';
