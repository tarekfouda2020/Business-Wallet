part of 'DetailsWidgetsImports.dart';

class BuildDropItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  final GenericCubit genericCubit;

  BuildDropItem(
      {required this.title, required this.onTap, required this.genericCubit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        color: MyColors.black,
        child: Row(
          children: [
            MyText(
              title: title,
              color: genericCubit.state.data
                  ? MyColors.primary
                  : MyColors.greyWhite.withOpacity(.9),
              size: 12,
            ),
            Spacer(),
            Icon(
              genericCubit.state.data
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: genericCubit.state.data
                  ? MyColors.primary
                  : MyColors.greyWhite.withOpacity(.9),
            ),
          ],
        ),
      ),
    );
  }
}
