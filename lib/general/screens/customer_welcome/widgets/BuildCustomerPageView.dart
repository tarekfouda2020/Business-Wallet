part of 'WelcomeWidgetImports.dart';

class BuildCustomerPageView extends StatelessWidget {
  final WelcomeModel model;

  const BuildCustomerPageView({Key? key, required this.model}) : super(key: key);

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
            flex: 2,
          ),
          Image.asset(
            model.image!,
            fit: BoxFit.contain,
            height: 330,
          ),
          Spacer(
            flex: 3,
          ),
          MyText(
            title: model.desc!,
            size: 14,
            color: MyColors.white,
            alien: TextAlign.start,
          ),
          if (model.last) InkWell(
            onTap: ()=> AutoRouter.of(context).push(RegisterRoute()),
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.symmetric(vertical: 12),
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              alignment: Alignment.center,
              child: MyText(
                title: "تسجيل",
                color: MyColors.black,
                size: 12,
              ),
            ),
          ) else Padding(
            padding: const EdgeInsets.all(30),
            child: FloatingActionButton(
              onPressed: () => model.pageCubit!.onUpdateData(model.index! + 1),
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
