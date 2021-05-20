part of 'DetailsWidgetsImports.dart';

class BuildCommentsDrop extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;

  BuildCommentsDrop({required this.companyMainDetailsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyMainDetailsData.commentsDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "معلومات التواصل",
                onTap: () => companyMainDetailsData.commentsDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyMainDetailsData.commentsDropCubit)

            // Visibility(
            //   visible: state.data,
            //   child: BuildCustomerData(),
            //   replacement: Container(),
            // ),
          ],
        );
      },
    );
  }
}
