part of 'SwitchPageImports.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  SwitchPageData switchPageData = SwitchPageData();

  @override
  void initState() {
    switchPageData.initPagesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondary,
      body: BlocBuilder<GenericCubit<int>, GenericState<int>>(
        bloc: switchPageData.pagesCubit,
        builder: (_, state) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: switchPageData.data[state.data],
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
