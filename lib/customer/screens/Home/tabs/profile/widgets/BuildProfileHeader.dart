part of 'ProfileWidgetsImports.dart';

class BuildProfileHeader extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;

  const BuildProfileHeader({this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    var customer = context.read<UserCubit>().state.model.customerModel;

    return Container(
      color: MyColors.black,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          BuildProfilePhoto(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: MyText(
                title: customer!.userName!,
              ),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.primary),
              alignment: Alignment.center,
              child: MyText(
                title: buttonText,
                color: MyColors.blackOpacity,
                size: 9,
              ),
            ),
          )
        ],
      ),
    );
  }
}
