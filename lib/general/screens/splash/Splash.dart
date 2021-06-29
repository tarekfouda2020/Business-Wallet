part of 'SplashImports.dart';

class Splash extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const Splash({required this.navigatorKey});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // Future.delayed(Duration(microseconds: 200));
    Utils.manipulateSplashData(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Res.bg,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: AnimationContainer(
            index: 0,
            vertical: true,
            duration: Duration(milliseconds: 1500),
            distance: MediaQuery.of(context).size.height * .3,
            child: Hero(
              tag: Res.logo,
              child: Image.asset(
                Res.logo,
                width: 270,
                height: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
