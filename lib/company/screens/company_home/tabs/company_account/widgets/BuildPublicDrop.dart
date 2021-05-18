part of 'CompAccountWidgetsImports.dart';

class BuildPublicDrop extends StatelessWidget {
  final CompanyAccountData companyAccountData;

  BuildPublicDrop({required this.companyAccountData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyAccountData.closedPublicDrop,
      builder: (_, state) {
        return Column(
          children: [
            InkWell(
              onTap: () =>
                  companyAccountData.closedPublicDrop.onUpdateData(!state.data),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 15),
                color: MyColors.black,
                child: Row(
                  children: [
                    MyText(
                      title: "خصائص عامة",
                      color: MyColors.primary,
                      size: 12,
                    ),
                    Spacer(),
                    Icon(
                      state.data
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: state.data
                          ? MyColors.primary
                          : MyColors.greyWhite.withOpacity(.9),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: state.data,
              child: BuildPublicData(),
              replacement: Container(),
            ),
          ],
        );
      },
    );
  }
}
