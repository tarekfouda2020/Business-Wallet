part of 'HomeImports.dart';

class Home extends StatefulWidget {
  final int index;

  const Home(this.index);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  HomeData homeData = HomeData();

  @override
  void initState() {
    GlobalNotification.instance.setupNotification(context);
    homeData.initController(this, widget.index);
    WidgetsBinding.instance?.addObserver(this);
    homeData.dynamicLinkService.retrieveDynamicLink(context);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      new Timer(
        const Duration(milliseconds: 2000),
        () {
          print("ahmed");
          homeData.dynamicLinkService.retrieveDynamicLink(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: DefaultTabController(
        initialIndex: widget.index,
        length: 5,
        child: Scaffold(
          extendBody: true,
          floatingActionButton: BuildFloatingButton(homeData),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: BuildTabBarPages(homeData),
          bottomNavigationBar: BuildTabBarBody(
            homeData: homeData,
            index: widget.index,
          ),
        ),
      ),
      onWillPop: homeData.onBackPressed,
    );
  }
}
