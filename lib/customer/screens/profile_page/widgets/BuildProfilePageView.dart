part of 'ProfilePageWidgetsImports.dart';

class BuildProfilePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var customer = context.read<UserCubit>().state.model.customerModel;
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        BuildProfileHeader(
          buttonText: "تعديل الصفحة الشخصية",
          onTap: () => AutoRouter.of(context).push(EditProfileRoute()),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: MyColors.black,
          height: 35,
          child: MyText(
            title: "الصفحة الشخصية",
          ),
        ),
        BuildInfoItem(
          iconData: Icons.phone_in_talk,
          title: "رقم الجوال",
          details: customer!.phoneNumber!,
          iconColor: Colors.green,
        ),
        BuildInfoItem(
          iconData: Icons.email_sharp,
          title: "البريد الالكتروني",
          details: customer.email!,
        ),
        BuildInfoItem(
          iconData: Icons.person,
          title: "الجنس",
          details: (customer.genderUser == "f") ? "انثي" : "ذكر",
        ),
        BuildInfoItem(
          iconData: Icons.calendar_today_outlined,
          title: "تاريخ الميلاد",
          details: customer.birthDateUser!,
        ),
        BuildInfoItem(
          iconData: Icons.home,
          title: "السكن",
          details: (customer.accommodationType == null)
              ? "لم يحدد بعد"
              : customer.accommodationType!,
        ),
        BuildInfoItem(
          iconData: Icons.directions_bus,
          title: "مستوى التعليم",
          details: (customer.educationLevel == null)
              ? "لم يحدد بعد"
              : customer.educationLevel!,
        ),
        BuildInfoItem(
          iconData: MdiIcons.accountGroup,
          title: "أفراد الأسرة",
          details: (customer.numFamily == null)
              ? "لم يحدد بعد"
              : "${customer.numFamily!}أفراد",
        ),
        BuildInfoItem(
          iconData: Icons.monetization_on,
          title: "متوسط الدخل",
          details: (customer.averageIncomePerYear == null)
              ? "لم يحدد بعد"
              : "${customer.averageIncomePerYear!}ريال سعودي",
        ),
      ],
    );
  }
}
