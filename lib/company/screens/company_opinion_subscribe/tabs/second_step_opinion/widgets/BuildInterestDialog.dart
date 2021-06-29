part of 'SecStepOpinionWidgetsImports.dart';

class BuildInterestDialog extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const BuildInterestDialog({required this.compOpinionSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: BlocBuilder<GenericCubit<List<DropDownSelected>>, GenericState<List<DropDownSelected>>>(
        bloc: compOpinionSubscribeData.interestCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: state.data[index].name,
                            size: 13,
                            color: MyColors.white,
                          ),
                          Checkbox(
                            value: state.data[index].selected,
                            onChanged:(value) {
                              compOpinionSubscribeData.onItemChanged(
                                  state.data[index].id, index);
                            },
                            checkColor: MyColors.white,
                            activeColor: MyColors.primary,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }else{
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }

        },
      ),
    );
  }
}
