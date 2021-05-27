part of 'CompanyRegisterCommercialImports.dart';

class CompanyRegisterCommercial extends StatefulWidget {
  @override
  _CompanyRegisterCommercialState createState() =>
      _CompanyRegisterCommercialState();
}

class _CompanyRegisterCommercialState extends State<CompanyRegisterCommercial> {
  final CompanyRegisterCommercialData companyRegisterCommercialData =
      new CompanyRegisterCommercialData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        HeaderLogo(),
        MyText(
          title: "المنشأة التجارية يشترط وجود سجل تجاري نشط",
          size: 14,
          color: MyColors.white,
        ),
        BuildCommercialForm(
          companyRegisterCommercialData: companyRegisterCommercialData,
        ),
        DefaultButton(
          title: "تأكيد",
          onTap: () =>
              AutoRouter.of(context).push(CompanyRegisterInterestsRoute()),
          color: MyColors.primary,
          textColor: MyColors.blackOpacity,
        ),
      ],
    ),);
  }
}
