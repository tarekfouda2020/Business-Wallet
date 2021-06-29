part of 'SecondStepSpecialImports.dart';

class SecondStepSpecial extends StatefulWidget {
  final CompSpecialSubscribeData compSpecialSubscribeData;

  const SecondStepSpecial({required this.compSpecialSubscribeData});

  @override
  _SecondStepSpecialState createState() => _SecondStepSpecialState();
}

class _SecondStepSpecialState extends State<SecondStepSpecial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "باقة تميز",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          BuildStepper(
            step1: true,
            step2: true,
          ),
          BuildReviewPrice(
            compSpecialSubscribeData: widget.compSpecialSubscribeData,
          ),
          BuildReviewDetails(
            compSpecialSubscribeData: widget.compSpecialSubscribeData,
          ),
          BuildButtonList(
            compSpecialSubscribeData: widget.compSpecialSubscribeData,
          ),
        ],
      ),
    );
  }
}
