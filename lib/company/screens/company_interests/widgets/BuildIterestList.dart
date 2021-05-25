part of 'CompInterestsWidgetsImports.dart';
class BuildInterestList extends StatelessWidget {
  final CompanyInterestData companyInterestData;

  BuildInterestList({required this.companyInterestData});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<GenericCubit, GenericState>(
          bloc: companyInterestData.interestCubit,
          builder: (context, state) {
            return Wrap(
              spacing: 5,
              runSpacing: 5,
              children: List.generate(
                3,
                    (index) => BuildInterestItem(
                  title: "مصانع",
                  onChange:
                  companyInterestData.interestCubit.onUpdateData,
                  selected: state.data,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
