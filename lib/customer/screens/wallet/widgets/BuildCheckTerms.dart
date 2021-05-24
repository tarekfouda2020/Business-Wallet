part of'WalletWidgetsImports.dart';
class BuildCheckTerms extends StatelessWidget {
  final WalletData walletData;

  const BuildCheckTerms({required this.walletData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: Checkbox.width,
            height: Checkbox.width,
            child: BlocBuilder<GenericCubit<bool>, GenericState>(
              bloc: walletData.checkCubit,
              builder: (context, state) {
                return Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  activeColor: MyColors.primary,
                  checkColor: MyColors.white,
                  value: state.data,
                  onChanged: (val) =>
                      walletData.checkCubit.onUpdateData(!state.data),
                );
              },
            ),
          ),
          SizedBox(
            width: 10,
          ),
          MyText(
            title: "الموافقه علي عمليه التحويل",
            color: MyColors.greyWhite.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
