part of 'FourthStepSpecialImports.dart';

class FourthStepSpecial extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const FourthStepSpecial(
      {required this.subscribeCubit, required this.movePage});

  @override
  _FourthStepSpecialState createState() => _FourthStepSpecialState();
}

class _FourthStepSpecialState extends State<FourthStepSpecial> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
