part of 'CompProfileWidgetsImports.dart';

class BuildInterestDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildInterestDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                height: 65,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, index) => BuildInterestItem(
                    title: "اعلام وتسويق",
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
