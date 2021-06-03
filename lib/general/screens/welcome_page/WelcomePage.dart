part of 'WelcomePageImports.dart';

class WelcomePage extends StatefulWidget {
  final IntroModel? introModel;

  WelcomePage({this.introModel});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomePageData welcomePageData = new WelcomePageData();

  @override
  void initState() {
    print("____________${widget.introModel?.kayanFour}");

    welcomePageData.initPagesData(widget.introModel);

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
