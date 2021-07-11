part of 'CompInterestsWidgetsImports.dart';

class BuildInterestList extends StatelessWidget {
  final CompanyInterestData companyInterestData;

  BuildInterestList({required this.companyInterestData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<List<CompInterestModel>>,
        GenericState<List<CompInterestModel>>>(
      bloc: companyInterestData.interestCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  state.data.length,
                  (index) => BuildInterestItem(
                    title: state.data[index].name,
                    onChange: (value) => companyInterestData.onItemChanged(
                        state.data[index].id, index),
                    selected: state.data[index].active,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Expanded(
            child: Center(
              child: LoadingDialog.showLoadingView(),
            ),
          );
        }
      },
    );
  }
}
