part of 'FirstStepBrochureImports.dart';

class FirstStepBrochure extends StatefulWidget {
  final CompBrochureSubscribeData compBrochureSubscribeData;

  const FirstStepBrochure({required this.compBrochureSubscribeData});

  @override
  _FirstStepBrochureState createState() => _FirstStepBrochureState();
}

class _FirstStepBrochureState extends State<FirstStepBrochure> {
  @override
  void initState() {
    widget.compBrochureSubscribeData.fetchBrochureData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "باقة بروشور",
      ),
      body: BlocBuilder<GenericCubit<BrochureDetailsModel?>,
          GenericState<BrochureDetailsModel?>>(
        bloc: widget.compBrochureSubscribeData.brochureDataCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                BuildStepper(
                  step1: true,
                ),
                BuildContact(
                  brochureDetailsModel: state.data!,
                ),
                BuildDesc(
                  desc: state.data!.details,
                ),
                BuildServices(
                  serviceModel: state.data!.services,
                ),
                BuildProducts(
                  images: state.data!.images,
                ),
                BuildFileView(
                  pdf: state.data!.fileName,
                ),
                DefaultButton(
                  color: MyColors.primary,
                  textColor: MyColors.blackOpacity,
                  borderRadius: BorderRadius.circular(30),
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  title: "التالي",
                  onTap: () => widget.compBrochureSubscribeData.navigateToSec(
                    context,
                    state.data!.businessId,
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
