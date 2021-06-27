part of 'CompProfileWidgetsImports.dart';

class BuildInterestDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildInterestDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyProfileData.interestDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
              title: "اهتمامات العملاء التي ترغب بالظهور بها",
              genericCubit: companyProfileData.interestDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: Visibility(
                visible: company!.interests!.isEmpty,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: MyText(
                    title: "لا يوجد اهتمامات",
                    size: 12,
                    color: MyColors.white,
                  ),
                ),
                replacement: Container(
                  height: 65,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: company.interests!.length,
                    itemBuilder: (_, index) => BuildInterestItem(
                      title: company.interests![index].name,
                    ),
                  ),
                ),
              ),
              replacement: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ],
        );
      },
    );
  }
}
