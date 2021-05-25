part of 'ProfileWidgetsImports.dart';

class BuildProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: const EdgeInsets.only(top: 15, bottom: 60),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          BuildProfileItem(
            title: "رقم المحفظة",
            icon: Icons.code,
            onTap: () => AutoRouter.of(context).push(NumberWalletRoute()),
          ),
          BuildProfileItem(
            title: "المحفظة",
            icon: Icons.monetization_on,
            onTap: () => AutoRouter.of(context).push(WalletRoute()),
          ),
          BuildProfileItem(
            title: "الاهتمامات",
            icon: MdiIcons.accountGroup,
            onTap: () => AutoRouter.of(context).push(ImportantRoute()),
          ),
          BuildProfileItem(
            title: "المراسلات",
            icon: MdiIcons.chatProcessingOutline,
            onTap: () => AutoRouter.of(context).push(ConversationRoute()),
          ),
          BuildProfileItem(
            title: "التعليقات",
            icon: Icons.message,
            onTap: () => AutoRouter.of(context).push(CommentsRoute()),
          ),
          BuildProfileItem(
            title: "مشاركة التطبيق",
            icon: Icons.share,
          ),
          BuildProfileItem(
            title: "معلومات التطبيق",
            icon: Icons.settings,
            onTap: () => AutoRouter.of(context).push(AppInfoRoute()),
          ),
          BuildProfileItem(
            title: "تواصل معنا",
            icon: Icons.phone_in_talk,
            onTap: () => AutoRouter.of(context).push(ContactUsRoute()),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: MyColors.black,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  size: 30,
                  color: MyColors.primary,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(
                      title: "تسجيل الخروج",
                      size: 14,
                      color: MyColors.primary,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
