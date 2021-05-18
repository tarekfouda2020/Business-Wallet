part of 'FollowersImports.dart';

class Followers extends StatefulWidget {
  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: "متابعتي",
      search: BuildFollowersSearch(),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(
                10,
                    (index) => BuildProviderItem()
            ),
          ),
        ),
      ),
    );
  }
}
