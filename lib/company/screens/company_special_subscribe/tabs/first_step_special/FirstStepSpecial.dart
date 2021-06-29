part of 'FirstStepSpecialImports.dart';

class FirstStepSpecial extends StatefulWidget {
  final CompSpecialSubscribeData compSpecialSubscribeData;

  const FirstStepSpecial({required this.compSpecialSubscribeData});

  @override
  _FirstStepSpecialState createState() => _FirstStepSpecialState();
}

class _FirstStepSpecialState extends State<FirstStepSpecial> {
  final FirstStepSpecialData firstStepSpecialData = new FirstStepSpecialData();

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
          ),
          BuildForm(
            compSpecialSubscribeData: widget.compSpecialSubscribeData,
          ),
          BuildPrice(
            compSpecialSubscribeData: widget.compSpecialSubscribeData,
          ),
          LoadingButton(
            btnKey: widget.compSpecialSubscribeData.btnKey,
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: 30,
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () =>
                widget.compSpecialSubscribeData.onSpecialSubscribe(context),
          )
        ],
      ),
    );
  }
}
