part of 'EditProfileWidgetsImports.dart';

class BuildInterestDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildInterestDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.interestDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildDropItem(
                title: "اهتمامات العملاء التي ترغب بالظهور بها",
                genericCubit: companyEditProfileData.interestDropCubit),
            Visibility(
              visible: state.data,
              child: Column(
                children: [
                  BlocBuilder<GenericCubit<List<DropDownModel>>, GenericState<List<DropDownModel>>>(
                    bloc: companyEditProfileData.interestCubit,
                    builder: (context, state) {
                      return Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: List.generate(
                          state.data.length,
                          (index) => BuildCheckItem(
                            title: state.data[index].name,
                            onChange: (bool value)=> companyEditProfileData.changeInterestItem(index,value),
                            selected: state.data[index].selected,
                          ),
                        ),
                      );
                    },
                  ),
                ],
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
