part of 'ThirdStepSpecialImports.dart';

class ThirdStepSpecial extends StatefulWidget {
  final CompSpecialSubscribeData compSpecialSubscribeData;

  const ThirdStepSpecial({required this.compSpecialSubscribeData});

  @override
  _ThirdStepSpecialState createState() => _ThirdStepSpecialState();
}

class _ThirdStepSpecialState extends State<ThirdStepSpecial> {
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
            step3: true,
          ),
          BuildReviewPrice(
            compSpecialSubscribeData: widget.compSpecialSubscribeData,
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
