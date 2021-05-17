part of 'SelectUserWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MyText(
            title: "نوع الحساب",
            size: 15,
            color: MyColors.white,
          ),
          DefaultButton(
            title: "فرد",
            onTap: () => AutoRouter.of(context).push(CustomerWelcomeRoute()),
            margin: const EdgeInsets.all(20),
            borderRadius: BorderRadius.circular(20),
            color: MyColors.white,
            textColor: MyColors.black,
          ),
          DefaultButton(
            title: "منشأة تجارية",
            onTap: () => AutoRouter.of(context).push(WelcomePageRoute()),
            margin: EdgeInsets.symmetric(horizontal: 20),
            borderRadius: BorderRadius.circular(20),
            color: MyColors.white,
            borderColor: MyColors.white,
            textColor: MyColors.black,
          ),
        ],
      ),
    );
  }
}
