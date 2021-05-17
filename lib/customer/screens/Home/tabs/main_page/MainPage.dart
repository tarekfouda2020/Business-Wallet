part of 'MainPageImports.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
          height: 160,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Res.bgheader), fit: BoxFit.fill)),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      size: 30,
                      color: MyColors.white,
                    ),
                    Image.asset(
                      Res.logo,
                      height: 40,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: MyColors.secondary,
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.black,
                      )
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        // onTap: ,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: Row(
                            children: [
                              MyText(
                                title: "المنطقة",
                                size: 10,
                                color: MyColors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        // onTap: ,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: Row(
                            children: [
                              MyText(
                                title: "الاهتمامات",
                                size: 10,
                                color: MyColors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        // onTap: ,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: Row(
                            children: [
                              MyText(
                                title: "أخرى",
                                size: 10,
                                color: MyColors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: MyColors.primary,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: MyText(
                          title: "البحث",
                          size: 10,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  Res.noun_men,
                  height: 10,
                  color: MyColors.white,
                ),
                SizedBox(
                    height: 15,
                    child: VerticalDivider(
                      thickness: 1,
                      color: MyColors.white,
                    )),
                Image.asset(
                  Res.noun_mapp,
                  height: 13,
                  color: MyColors.white,
                ),
              ],
            ),
          ),
          Flexible(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: List.generate(10, (index) => Container(
                  height: MediaQuery.of(context).size.height *0.15,
                  width: MediaQuery.of(context).size.width *0.40,
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                )
                ),
              )
          )
        ],
      ),
    );
  }
}
