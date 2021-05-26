part of 'FourthStepImports.dart';

class FourthStep extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  FourthStep({required this.subscribeCubit, required this.movePage});

  @override
  _FourthStepState createState() => _FourthStepState();
}

class _FourthStepState extends State<FourthStep> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
