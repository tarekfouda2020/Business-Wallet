part of 'RegisterWidgetsImports.dart';

class BuildCheckTerms extends StatelessWidget {
  final RegisterData registerData;
  const BuildCheckTerms(this.registerData);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
          bloc: registerData.termsCubit,
          builder: (_, state){
            return Checkbox(
                value: state.data,
                // onChanged: null,
                onChanged: (val) =>
                    registerData.termsCubit.onUpdateData(!state.data)
            );
          },
        ),

        InkWell(
            onTap: () => AutoRouter.of(context)
                .push(TermsRoute()),
            child: MyText(
              title: "اوافق علي الشروط والأحكام",
              color: MyColors.primary,
            )),
      ],
    );
  }

}
