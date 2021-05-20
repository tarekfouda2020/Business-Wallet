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
                "رقم الجوال",
                Icons.phone_in_talk_outlined,
                Colors.green,
                "desc",
              ),
              BuildContactItem(
                "البريد الالكتروني",
                Icons.phone_in_talk_outlined,
                Colors.yellow,
                "desc",
              ),
            ],
          ),
          Row(
            children: [
              BuildContactItem(
                "رابط المنشأة",
                Icons.phone_in_talk_outlined,
                Colors.blue,
                "desc",
              ),
              BuildContactItem(
                "اجراء محادثة",
                Icons.phone_in_talk_outlined,
                Colors.yellow,
                "desc",
              ),
            ],
          ),
          Row(
            children: [
              BuildContactItem(
                "العنوان",
                MdiIcons.mapMarkerRadius,
                Colors.red,
                "desc",
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
