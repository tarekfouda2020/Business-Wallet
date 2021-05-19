part of 'HomeImports.dart';

class HomeData {

  final GenericCubit<int> homeTabCubit = GenericCubit(4);
  Animation<double> ?animation;
  late AnimationController animationController;
  late CurvedAnimation curve;
  int currentIndex=0;

  List<BottomTabModel> tabs = [
    BottomTabModel(iconData: Icons.favorite,),
    BottomTabModel(iconData: Icons.store_mall_directory),
    BottomTabModel(iconData: MdiIcons.bullhorn),
    BottomTabModel(iconData: Icons.person),
  ];

  void initBottomNavigation(TickerProvider ticker){
    tabController =new TabController(length: 4, vsync: ticker);
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: ticker,
    );
    curve = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    animation = Tween<double>(begin: 0, end: 1,).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => animationController.forward(),
    );
  }

  late TabController tabController;

  void initController(TickerProvider tickerProvider, int index){
     tabController = TabController(length: 5, vsync: tickerProvider);
     tabController.index = index;
  }
  
  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }

  void onChangePage(int index) {
    tabController.animateTo(index,
        duration: Duration(milliseconds: 500), curve: Curves.bounceOut);
    homeTabCubit.onUpdateData(index);
  }

  void animateTabsPages(int index,BuildContext context){
    if(index!=homeTabCubit.state.data){
      homeTabCubit.onUpdateData(index);
      tabController.animateTo(index);
    }
  }

  void homeClick(BuildContext context){
    tabController.animateTo(4);
    homeTabCubit.onUpdateData(4);
  }


}