part of 'EditProfileWidgetsImports.dart';

class BuildInterestDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildInterestDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

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
                  BlocBuilder<GenericCubit, GenericState>(
                    bloc: companyEditProfileData.interestCubit,
                    builder: (context, state) {
                      return Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: List.generate(
                          company!.interests!.length,
                          (index) => BuildCheckItem(
                            title: company.interests![index].name,
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
