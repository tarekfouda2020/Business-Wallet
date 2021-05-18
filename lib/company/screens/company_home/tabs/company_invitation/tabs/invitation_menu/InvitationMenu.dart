part of 'InvitationMenuImports.dart';

class InvitationMenu extends StatefulWidget {
  @override
  _InvitationMenuState createState() => _InvitationMenuState();
}

class _InvitationMenuState extends State<InvitationMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: 2,
      itemBuilder: (_, index) {
        return BuildFavItem();
      },
    );
  }
}
