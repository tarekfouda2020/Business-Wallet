part of 'EditProfileWidgetsImports.dart';

class BuildBranchDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildBranchDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.branchDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildShowDropItem(
              title: "الفروع",
              onTap: () => companyEditProfileData.branchDropCubit
                  .onUpdateData(!state.data),
              showAddBranch: true,
              radioCubit: companyEditProfileData.showBranchCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.branchDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: MyText(
                      title: "الموقع",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: " من فضلك ادخل الموقع",
                    controller: companyEditProfileData.branchLocation,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "رقم الهاتف",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: IconTextFiled(
                          hint: "رقم الهاتف",
                          controller: companyEditProfileData.branchPhone,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          action: TextInputAction.next,
                          suffixIcon: Icon(
                            Icons.edit,
                            size: 20,
                          ),
                          type: TextInputType.emailAddress,
                          validate: (value) => value!.validateEmpty(context),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: MyColors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: 30,
                                maxHeight: 50,
                                minWidth: double.infinity,
                                maxWidth: double.infinity),
                            child: MyText(
                              alien: TextAlign.start,
                              title: "+966",
                              color: MyColors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "ساعات العمل من",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "ساعات العمل من",
                    controller: companyEditProfileData.workHoursFrom,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "ساعات العمل الي",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "ساعات العمل الي",
                    controller: companyEditProfileData.workHoursTo,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "الحالة",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "الحالة",
                    controller: companyEditProfileData.branchStatus,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              replacement: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ],
        );
      },
    );
  }
}
