part of 'ReconciliationWidgetsImports.dart';

class BuildPersonalInfo extends StatelessWidget {
  final ReconciliationDataModel reconciliationDataModel;

  const BuildPersonalInfo({required this.reconciliationDataModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: MyColors.black,
          child: MyText(
            title: "الصفحة الشخصية",
            size: 14,
            color: MyColors.greyWhite.withOpacity(.9),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Table(
            children: [
              TableRow(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              color: MyColors.grey.withOpacity(.5), width: 1),
                          left: BorderSide(
                              color: MyColors.grey.withOpacity(.5), width: 1),
                        ),
                      ),
                      height: 65,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MyText(
                            title: "الاسم",
                            size: 12,
                            color: MyColors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyText(
                            title: reconciliationDataModel.name,
                            size: 10,
                            color: MyColors.grey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        right: BorderSide(
                            color: MyColors.grey.withOpacity(.5), width: 1),
                        left: BorderSide(
                            color: MyColors.grey.withOpacity(.5), width: 1),
                      )),
                      height: 65,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MyText(
                            title: "رقم الجوال",
                            size: 12,
                            color: MyColors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyText(
                            title: reconciliationDataModel.phoneNumber,
                            size: 10,
                            color: MyColors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: MyColors.grey.withOpacity(.3), width: 1))),
              TableRow(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            color: MyColors.grey.withOpacity(.5), width: 1),
                        left: BorderSide(
                            color: MyColors.grey.withOpacity(.5), width: 1),
                      ),
                    ),
                    height: 65,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MyText(
                          title: "البريد الالكتروني",
                          size: 12,
                          color: MyColors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MyText(
                          title: reconciliationDataModel.email,
                          size: 10,
                          color: MyColors.grey,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                          color: MyColors.grey.withOpacity(.5), width: 1),
                      left: BorderSide(
                          color: MyColors.grey.withOpacity(.5), width: 1),
                    )),
                    height: 65,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MyText(
                          title: "العنوان",
                          size: 12,
                          color: MyColors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MyText(
                          title: reconciliationDataModel.address,
                          size: 10,
                          color: MyColors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.grey.withOpacity(.3),
                    width: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
