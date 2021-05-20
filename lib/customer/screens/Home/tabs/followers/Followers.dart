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
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10 ,bottom: 60),
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
