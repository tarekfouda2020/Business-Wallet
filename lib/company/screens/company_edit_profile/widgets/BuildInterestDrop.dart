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
                onTap: () => companyEditProfileData.interestDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyEditProfileData.interestDropCubit),
            Visibility(
              visible: state.data,
              child: Column(
                children: [
                  BlocBuilder<GenericCubit, GenericState>(
                    bloc: companyEditProfileData.interestCubit,
                    builder: (context, state) {
                      return Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: List.generate(
                          3,
                          (index) => BuildCheckItem(
                            title: "مصانع",
                            onChange: companyEditProfileData
                                .interestCubit.onUpdateData,
                            selected: state.data,
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
