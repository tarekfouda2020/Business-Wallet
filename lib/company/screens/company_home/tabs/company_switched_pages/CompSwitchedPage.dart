part of 'CompSwitchedPageImports.dart';

class CompSwitchedPage extends StatefulWidget {
  @override
  _CompSwitchedPageState createState() => _CompSwitchedPageState();
}

class _CompSwitchedPageState extends State<CompSwitchedPage> {
  final CompSwitchedPageData compSwitchedPageData = new CompSwitchedPageData();

  @override
  void initState() {
    compSwitchedPageData.initPagesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondary,
      body: BlocBuilder<GenericCubit<int>, GenericState<int>>(
        bloc: compSwitchedPageData.pagesCubit,
        builder: (_, state) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: compSwitchedPageData.data[state.data],
            transitionBuilder: (child, animation) {
              return FadeTransition(
                child: child,
                opacity: animation,
              );
            },
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
