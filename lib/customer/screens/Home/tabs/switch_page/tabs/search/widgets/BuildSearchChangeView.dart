part of 'SearchWidgetsImports.dart';

class BuildSearchChangeView extends StatelessWidget {
  final SearchData searchData;
  const BuildSearchChangeView({required this.searchData});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: AutoCompleteTextField(
            controller: searchData.search,
            style: TextStyle(
                fontSize: 12,
                color: MyColors.white,
                fontFamily: "cairo"),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(25)),
                    borderSide: BorderSide(
                        color: MyColors.greyWhite,
                        width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(25)),
                    borderSide: BorderSide(
                        color: MyColors.greyWhite,
                        width: 1)),
                hintText: "ffdf",
                hintStyle: TextStyle(
                    fontSize: 12,
                    color: MyColors.grey,
                    fontFamily: "cairo"),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 5, vertical: 5)),
            // borderColor: MyColors.primary,
          ),
        ),
        // Expanded(
        //   flex: 7,
        //   child: LabelTextField(
        //     hint: "ابحث عما تريد",
        //     controller: searchData.search,
        //     validate: (value) => value!.validateEmpty(context),
        //     minHeight: 30,
        //     maxHeight: 45,
        //     // borderColor: MyColors.primary,
        //     margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        //   ),
        // ),
        Expanded(
          flex: 2,
          child: Container(
            width: 100,
            child: TabBar(
              indicatorColor: MyColors.darken.withOpacity(.1),
              tabs: [
                Tab(
                  child: Image.asset(
                    Res.noun_men,
                    color: MyColors.white,
                  ),
                ),
                Tab(
                  child: Image.asset(
                    Res.noun_mapp,
                    color: MyColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
