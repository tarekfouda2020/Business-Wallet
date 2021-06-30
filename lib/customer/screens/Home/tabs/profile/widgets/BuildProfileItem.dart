part of 'ProfileWidgetsImports.dart';

class BuildProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? page;
  final bool isWallet;
  final Function()? onTap;

  const BuildProfileItem(
      {required this.icon,
      required this.title,
      this.page,
      this.isWallet = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 800),
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, action) {
        return InkWell(
          onTap: onTap,
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: MyColors.black,
                          borderRadius: BorderRadius.circular(3)),
                      alignment: Alignment.center,
                      child: Icon(
                        icon,
                        size: 18,
                        color: MyColors.primary,
                      ),
                    ),
                    MyText(
                      title: title,
                      color: Colors.white70,
                      size: 11.5,
                    ),
                    Spacer(),
                    BlocBuilder<WalletCountCubit, WalletCountState>(
                      builder: (context, state) {
                        return Offstage(
                          offstage: !isWallet || state.count == 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColors.primary,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${state.count}",
                              style: TextStyle(
                                  fontSize: 10, color: MyColors.darken),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    thickness: 1,
                  ),
                )
              ],
            ),
          ),
        );
      },
      openBuilder: (context, action) {
        return page??Container();
      },
    );
  }
}
