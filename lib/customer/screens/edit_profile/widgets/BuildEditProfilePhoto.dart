part of'EditProfileWidgetsImports.dart';
class BuildEditProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.primary,
            ),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(6),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      Res.on3,
                    ),
                    fit: BoxFit.fill)),
          ),
        ),
        Positioned(
          bottom: 0,
          top: 30,
          left: 60,
          right: 5,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: MyColors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: MyColors.primary,
                width: 1,
              ),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              color: MyColors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
