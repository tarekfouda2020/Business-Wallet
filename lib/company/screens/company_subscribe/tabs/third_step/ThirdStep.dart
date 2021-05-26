part of 'ThirdStepImports.dart';

class ThirdStep extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  ThirdStep({required this.subscribeCubit, required this.movePage});

  @override
  _ThirdStepState createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
