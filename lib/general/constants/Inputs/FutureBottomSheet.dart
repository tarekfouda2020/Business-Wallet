import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/CustomInputDecoration.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CustomInputTextStyle.dart';
import 'custom_dropDown/CustomDropDown.dart';

class FutureBottomSheet<DataType> extends StatefulWidget {
  final dynamic data;
  final GlobalKey? dropKey;
  final String? label;
  final String? hint;
  final DataType? selectedItem;
  final bool showSelectedItem;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? labelSize;
  final dynamic validate;
  final dynamic onChange;
  final dynamic finData;
  final EdgeInsets? downIconPadding;
  final bool useName;
  final double? borderRadius;

  FutureBottomSheet(
      {this.label,
      this.hint,
      this.margin,
      this.validate,
      this.downIconPadding,
      this.useName = true,
      this.onChange,
      this.fontSize,
      this.labelSize,
      this.finData,
      this.dropKey,
      this.data,
      this.selectedItem,
      this.showSelectedItem = false,
      this.borderRadius});

  @override
  _DropdownTextFieldState<DataType> createState() =>
      _DropdownTextFieldState<DataType>();
}

class _DropdownTextFieldState<DataType> extends State<FutureBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: DropdownSearch<DataType>(
        key: widget.dropKey,
        mode: Mode.BOTTOM_SHEET,
        isFilteredOnline: true,
        maxHeight: 350,
        items: widget.data,
        onFind: widget.finData,
        validator: widget.validate,
        onChanged: widget.onChange,
        showSearchBox: true,
        showClearButton: false,
        textAlign: TextAlign.center,
        selectedItem: widget.selectedItem,
        itemAsString: (dynamic u) => widget.useName ? u.name : u,
        showSelectedItem: widget.showSelectedItem,
        style: TextStyle(fontSize: 8),
        itemStyle: CustomInputTextStyle(lang: lang),
        searchBoxDecoration: CustomInputDecoration(
            lang: lang,
            hint: "بحث",
            enableColor: Colors.white,
            focusColor: MyColors.primary,
            borderRaduis: 5,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        hint: widget.label,
        popupTitle: Container(
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: MyText(
              title: widget.label != null ? widget.label! : widget.hint!,
              size: 16,
              color: MyColors.white,
            ),
          ),
        ),
        popupShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        dropdownSearchDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(fontSize: 10),
          labelStyle: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
