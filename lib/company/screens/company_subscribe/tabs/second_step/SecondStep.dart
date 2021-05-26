part of 'SecondStepImports.dart';

class SecondStep extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  SecondStep({required this.subscribeCubit, required this.movePage});

  @override
  _SecondStepState createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
