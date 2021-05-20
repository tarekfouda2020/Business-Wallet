part of 'InvitationDetailsImports.dart';

class InvitationDetails extends StatefulWidget {
  @override
  _InvitationDetailsState createState() => _InvitationDetailsState();
}

class _InvitationDetailsState extends State<InvitationDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 6000,
      ),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 10000,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "",
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircularStepProgressIndicator(
                totalSteps: 10000,
                currentStep: _animation.value.toInt(),
                selectedColor: MyColors.primary,
                unselectedColor: MyColors.secondary,
                width: 70,
                height: 70,
                padding: 0,
                stepSize: 5,
                roundedCap: (_, isSelected) => isSelected,
                child: Center(
                  child: MyText(
                    title: "10",
                  ),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
