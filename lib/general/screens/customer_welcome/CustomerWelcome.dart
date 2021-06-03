part of 'CustomerWelcomeImports.dart';

class CustomerWelcome extends StatefulWidget {
  final IntroModel? introModel;

  CustomerWelcome({ this.introModel});

  @override
  _CustomerWelcomeState createState() => _CustomerWelcomeState();
}

class _CustomerWelcomeState extends State<CustomerWelcome> {
  final CustomerWelcomeData welcomePageData = new CustomerWelcomeData();

  @override
  void initState() {
    print("__________###__${widget.introModel!.textStepOneUser}");

    welcomePageData.initPagesData(introModel: widget.introModel!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: MyColors.secondary,
        body: BlocBuilder<GenericCubit<int>, GenericState<int>>(
          bloc: welcomePageData.pagesCubit,
          builder: (_, state) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 1500),
              reverseDuration: Duration(milliseconds: 1500),
              child: welcomePageData.data[state.data],
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  child: child,
                  opacity: animation,
                );
              },
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
            );
          },
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
