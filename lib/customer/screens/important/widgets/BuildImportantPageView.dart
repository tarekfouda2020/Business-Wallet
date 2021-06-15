part of 'ImportantWidgetsImports.dart';

class BuildImportantPageView extends StatelessWidget {
  final ImportantData importantData;
  final String userId;

  const BuildImportantPageView(
      {required this.importantData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<List<UserInterestModel>>,
        GenericState<List<UserInterestModel>>>(
      bloc: importantData.interestCubit,
      builder: (_, state) {
        if (state is GenericUpdateState) {
          return Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: List.generate(
                        state.data.length,
                        (index) => BuildImportantItem(
                          title: state.data[index].name,
                          onChange: (value) => importantData.onItemChanged(
                              state.data[index].id, index),
                          selected: state.data[index].choose,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              LoadingButton(
                btnKey: importantData.btnKey,
                title: "حفظ",
                color: MyColors.primary,
                onTap: () => importantData.saveImportantData(context, userId),
              )
            ],
          );
        } else {
          return Center(
            child: LoadingDialog.showLoadingView(),
          );
        }
      },
    );
  }
}
