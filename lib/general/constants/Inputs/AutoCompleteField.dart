import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class AutoCompleteField<DataType> extends StatelessWidget {
  final Function(DataType model) onSubmit;
  final SuggestionsCallback<DataType> onSearch;
  final String label;
  final TextEditingController controller;

  const AutoCompleteField(
      {required this.onSubmit,
      required this.onSearch,
      required this.label,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<DataType>(
      textFieldConfiguration: TextFieldConfiguration(
        autofocus: false,
        controller: controller,
        style: GoogleFonts.cairo(fontSize: 12,fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.grey.withOpacity(.8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: MyColors.primary,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          hintText: "  $label  ",
          hintStyle: GoogleFonts.cairo(fontSize: 14),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          filled: true,
          fillColor: MyColors.darken,
          suffixIcon: Icon(
            Icons.search,
            size: 20,
            color: MyColors.grey,
          ),
        ),
      ),
      suggestionsCallback: onSearch,
      itemBuilder: (context, DataType suggestion) {
        return Container(
          height: 45,
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: MyColors.secondary,
          child: Column(
            children: [
              MyText(
                title: suggestion.toString(),
                size: 10,
                color: MyColors.white,
              ),
              Divider(color: MyColors.greyWhite,)
            ],
          ),
        );
      },
      noItemsFoundBuilder: (context) {
        return Container(
          height: 40,
          alignment: Alignment.center,
          child: MyText(
            title: "لايوجد بيانات للبحث",
            size: 10,
            color: MyColors.white,
          ),
        );
      },
      onSuggestionSelected: onSubmit,
      hideOnEmpty: false,
      hideOnError: false,

    );
  }
}
