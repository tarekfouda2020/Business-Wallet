part of 'ProviderDetailsWidgetsImports.dart';

class BuildContactWidget extends StatelessWidget {
  final String title;
  final String detail;
  final IconData icon;
  final Color? iconColor;
  final Function()? onTap;

  const BuildContactWidget(
      {required this.title,
      required this.detail,
      required this.icon,
      this.iconColor,
       this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(title: title, size: 10),
       InkWell(
         onTap: onTap,
         child:  Row(
           children: [
             Container(
               margin: const EdgeInsets.all(5),
               child: Icon(
                 icon,
                 color: iconColor ?? MyColors.primary,
                 size: 15,
               ),
             ),
             MyText(
               title: detail,
               size: 9,
               color: MyColors.grey,
             )
           ],
         ),
       )
      ],
    );
  }
}
