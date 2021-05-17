part of 'WelcomeWidgetImports.dart';

class BuildPageView extends StatelessWidget {
  final WelcomeModel model;

  const BuildPageView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Res.bg), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 1,
          ),
          Image.asset(
            model.image!,
            fit: BoxFit.contain,
            height: 350,
          ),
          Spacer(
            flex: 2,
          ),
          IndicatorDots(pagesCubit: model.pageCubit),
          SizedBox(
            height: 30,
          ),
          MyText(
            title: model.desc!,
            size: 14,
            color: MyColors.white,
            alien: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: model.last
                ? DefaultButton(
                    title: "تسجيل",
                    onTap: () =>
                        AutoRouter.of(context).push(CompanyRegisterRoute()),
                    margin: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(30),
                    color: MyColors.primary,
                    textColor: MyColors.black,
                  )
                : FloatingActionButton(
                    onPressed: () => model.last
                        ? AutoRouter.of(context).push(LoginRoute())
                        : model.pageCubit!.onUpdateData(model.index! + 1),
                    backgroundColor: MyColors.primary,
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 25,
                      color: MyColors.secondary,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
