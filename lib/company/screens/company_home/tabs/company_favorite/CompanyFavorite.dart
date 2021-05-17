part of 'CompanyFavoriteImports.dart';

class CompanyFavorite extends StatefulWidget {
  @override
  _CompanyFavoriteState createState() => _CompanyFavoriteState();
}

class _CompanyFavoriteState extends State<CompanyFavorite> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: Container(
            height: 150,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                BuildTopHeader(title: "مفضلتي"),
                Positioned(
                  top: 85,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: MyColors.black,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: DropdownTextField(
                              hint: "المنطقة",
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              useName: true,
                            ),
                          ),
                          Expanded(
                            child: DropdownTextField(
                              hint: "الاهتمامات",
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              useName: true,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 35,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            width:
                                (MediaQuery.of(context).size.width - 20) * .15,
                            decoration: BoxDecoration(
                                color: MyColors.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            alignment: Alignment.center,
                            child: MyText(
                              title: "تأكيد",
                              size: 10,
                              color: MyColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
