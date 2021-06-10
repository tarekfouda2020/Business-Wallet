part of 'NumberWalletWidgetsImports.dart';

class BuildCode extends StatelessWidget {
  final NumberWalletData numberWalletData;

  const BuildCode({required this.numberWalletData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<String?>, GenericState<String?>>(
      bloc: numberWalletData.promoCode,
      builder: (_, state) {
        if (state is GenericUpdateState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColors.greyWhite),
                child: MyText(
                  title: state.data!,
                  size: 40,
                  color: MyColors.greyWhite.withOpacity(0.7),
                  // alien: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () => Utils.copToClipboard(text: state.data!),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.primary,
                  ),
                  child: Icon(
                    Icons.copy,
                    color: MyColors.black,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: LoadingDialog.showLoadingView(),
          );
        }
      },
    );
  }
}
