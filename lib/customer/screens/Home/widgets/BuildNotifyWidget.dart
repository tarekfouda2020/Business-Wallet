part of 'HomeWidgetsImports.dart';

class BuildNotifyWidget extends StatelessWidget {

  final int count;
  final int index;
  final int specific;

  const BuildNotifyWidget({required this.count, required this.index, required this.specific});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: index == specific && count > 0,
      child: Container(
        padding: EdgeInsets.all(4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, shape: BoxShape.circle),
        child: Text(
          "$count",
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

