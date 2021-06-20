part of 'CompProfileWidgetsImports.dart';

class BuildContactData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              BuildContactItem(
                title: "رقم الجوال",
                iconData: Icons.phone_in_talk_outlined,
                color: Colors.green,
                desc: "desc",
              ),
              BuildContactItem(
                title: "البريد الالكتروني",
                iconData: Icons.phone_in_talk_outlined,
                color: Colors.yellow,
                desc: "desc",
              ),
            ],
          ),
          Row(
            children: [
              BuildContactItem(
                title: "رابط المنشأة",
                iconData: Icons.phone_in_talk_outlined,
                color: Colors.blue,
                desc: "desc",
              ),
              BuildContactItem(
                title: "اجراء محادثة",
                iconData: Icons.phone_in_talk_outlined,
                color: Colors.yellow,
                desc: "desc",
              ),
            ],
          ),
          Row(
            children: [
              BuildContactItem(
                title: "العنوان",
                iconData: MdiIcons.mapMarkerRadius,
                color: Colors.red,
                desc: "desc",
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: CachedImage(
              url:
                  "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
              width: MediaQuery.of(context).size.width,
              height: 130,
            ),
          )
        ],
      ),
    );
  }
}
