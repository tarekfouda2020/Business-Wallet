part of 'EditProfileWidgetsImports.dart';

class BuildShowDropItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  final GenericCubit genericCubit;
  final GenericCubit<bool> radioCubit;
  final bool showTextField;
  final bool showAddBranch;
  final GenericCubit? branchCubit;
  final TextEditingController? controller;
  final CompanyEditProfileData companyEditProfileData;
  bool forwardArrow;

  BuildShowDropItem(
      {required this.title,
      required this.onTap,
      required this.genericCubit,
      required this.radioCubit,
      this.showTextField = false,
      this.showAddBranch = false,
      this.controller,
      this.forwardArrow = false,
      this.branchCubit,
      required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        color: MyColors.black,
        child: Row(
          children: [
            MyText(
              title: title,
              color: genericCubit.state.data
                  ? MyColors.primary
                  : MyColors.greyWhite.withOpacity(.9),
              size: 12,
            ),
            SizedBox(width: 10),
            Visibility(
              visible: showTextField,
              child: Expanded(
                flex: 3,
                child: LabelTextField(
                  hint: "",
                  minHeight: 30,
                  maxHeight: 40,
                  enabledColor: MyColors.white,
                  controller: controller ?? TextEditingController(),
                  validate: (value) => value!.validateEmpty(context),
                ),
              ),
              replacement: Spacer(),
            ),
            BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
              bloc: radioCubit,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BuildRadioItem(
                      title: "اظهار",
                      value: true,
                      selected: state.data,
                      onChange: radioCubit.onUpdateData,
                    ),
                    BuildRadioItem(
                      title: "اخفاء",
                      value: false,
                      selected: state.data,
                      onChange: radioCubit.onUpdateData,
                    ),
                  ],
                );
              },
            ),
            Visibility(
              visible: showAddBranch,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 45,
                height: 50,
                color: MyColors.primary,
                child: Icon(
                  MdiIcons.plus,
                  color: MyColors.black,
                  size: 30,
                ),
              ),
              replacement: SizedBox(
                width: 20,
              ),
            ),
            Visibility(
              visible: !forwardArrow,
              child: Icon(
                genericCubit.state.data
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: genericCubit.state.data
                    ? MyColors.primary
                    : MyColors.greyWhite.withOpacity(.9),
              ),
              replacement: Icon(
                Icons.arrow_forward_ios,
                color: MyColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
