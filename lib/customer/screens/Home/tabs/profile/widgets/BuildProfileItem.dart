part of 'ProfileWidgetsImports.dart';

class BuildProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() ?onTap;
  final bool isWallet;

  const BuildProfileItem({required this.icon, required this.title, this.onTap, this.isWallet = false});

  @override
  Widget build(BuildContext context) {
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
                    color: MyColors.grey,
                  ),
                ),
                MyText(
                  title: title,
                  color: MyColors.grey,
                  size: 11.5,
                ),
                Spacer(),
                BlocBuilder<WalletCountCubit, WalletCountState>(
                  builder: (context, state) {
                    return Offstage(
                      offstage: !isWallet || state.count==0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors.primary,
                        ),
                        alignment: Alignment.center,
                        child: Text("${state.count}",style: TextStyle(fontSize: 10,color: MyColors.darken),),
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 1,),
            )
          ],
        ),
      ),
    );
  }
}
