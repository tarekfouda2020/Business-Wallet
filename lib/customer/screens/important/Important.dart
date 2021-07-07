part of 'ImportantWidgets.dart';

class Important extends StatefulWidget {
  final String fromWhere;
  final String? userId;

  Important({this.fromWhere = "login", this.userId});

  @override
  _ImportantState createState() => _ImportantState();
}

class _ImportantState extends State<Important> {
  final ImportantData importantData = new ImportantData();

  @override
  void initState() {
    importantData.fetchIntro(context);
    importantData.fetchData(context,widget.userId!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: MyColors.darken,
        appBar: widget.fromWhere == "splash"
            ? DefaultAppBar(
                title: "قائمه الاهتمامات",
                actions: [
                  BlocBuilder<GenericCubit<IntroModel?>,
                      GenericState<IntroModel?>>(
                    bloc: importantData.introCubit,
                    builder: (_, state) {
                      return InkWell(
                        onTap: () {
                          AutoRouter.of(context)
                              .push(LoginRoute(introModel: state.data));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: MyText(
                            title: "تسجيل دخول",
                            size: 11,
                            color: MyColors.white,
                          ),
                        ),
                      );
                    },
                  )
                ],
              )
            : DefaultAppBar(
                title: "قائمه الاهتمامات",
              ),
        body: BuildImportantPageView(
          importantData: importantData,
          userId: widget.userId!,
        ),
      ),
      onWillPop: importantData.onBackPressed,
    );
  }
}
