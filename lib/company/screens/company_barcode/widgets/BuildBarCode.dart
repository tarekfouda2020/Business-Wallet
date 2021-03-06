part of 'CompBarcodeWidgetsImports.dart';

class BuildBarCode extends StatelessWidget {
  final CompanyBarcodeData companyBarcodeData;

  BuildBarCode({required this.companyBarcodeData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<BarcodeModel?>,
        GenericState<BarcodeModel?>>(
      bloc: companyBarcodeData.barcodeCubit,
      builder: (_, state) {
        if (state is GenericUpdateState) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 40),
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.white.withOpacity(.6),
                      child: QrImage(
                        data: state.data!.barCode,
                        foregroundColor: MyColors.blackOpacity,
                        version: QrVersions.auto,
                        size: 160,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: MyColors.primary),
                      child: IconButton(
                        icon: Icon(
                          Icons.copy,
                          color: MyColors.darken,
                        ),
                        onPressed: () => Utils.copToClipboard(
                          text: state.data!.barCode,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
