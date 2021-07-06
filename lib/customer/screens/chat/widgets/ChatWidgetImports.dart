import 'package:base_flutter/customer/models/MessageModel.dart';
import 'package:base_flutter/customer/screens/widgets/BuildNoItemFound.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/ChatTextField.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/localization/LocalizationMethods.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../ChatImports.dart';


part 'BuildChatMessages.dart';
part 'BuildRightMsg.dart';
part 'BuildLeftMsg.dart';
part 'BuildChatInput.dart';