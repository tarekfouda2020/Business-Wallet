part of 'CompRegisterWidgetsImport.dart';

class BuildTermsView extends StatelessWidget {
  final CompanyRegisterData companyRegisterData;

  const BuildTermsView({required this.companyRegisterData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyRegisterData.termCubit,
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Checkbox(
                activeColor: MyColors.primary,
                value: state.data,
                onChanged: (val) =>
                    companyRegisterData.termCubit.onUpdateData(!state.data),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => AutoRouter.of(context).push(TermsRoute()),
                  child: Row(
                    children: [
                      MyText(
                        title: "بالتسجيل في النظام فانت توافق علي",
                        color: MyColors.white,
                        size: 9,
                      ),
                      MyText(
                        title: "الشروط والاحكام",
                        color: MyColors.primary,
                        decoration: TextDecoration.underline,
                        size: 9,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
