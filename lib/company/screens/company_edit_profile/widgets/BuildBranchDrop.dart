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
              onTap: () => AutoRouter.of(context).push(CompanyBranchesRoute()),
              showAddBranch: false,
              radioCubit: companyEditProfileData.showBranchCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.branchDropCubit,
              forwardArrow: true,
            ),
            // Visibility(
            //   visible: state.data,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       BuildFormText(text: "الموقع"),
            //       IconTextFiled(
            //         hint: " من فضلك ادخل الموقع",
            //         controller: companyEditProfileData.branchLocation,
            //         action: TextInputAction.next,
            //         type: TextInputType.emailAddress,
            //         suffixIcon: Icon(
            //           Icons.edit,
            //           size: 20,
            //         ),
            //         margin: const EdgeInsets.symmetric(vertical: 10),
            //         validate: (value) => value!.validateEmpty(context),
            //       ),
            //       BuildFormText(text: "رقم الهاتف"),
            //       Row(
            //         children: [
            //           Expanded(
            //             flex: 4,
            //             child: IconTextFiled(
            //               hint: "رقم الهاتف",
            //               controller: companyEditProfileData.branchPhone,
            //               margin: const EdgeInsets.symmetric(vertical: 10),
            //               action: TextInputAction.next,
            //               suffixIcon: Icon(
            //                 Icons.edit,
            //                 size: 20,
            //               ),
            //               type: TextInputType.emailAddress,
            //               validate: (value) => value!.validateEmpty(context),
            //             ),
            //           ),
            //           Expanded(
            //             flex: 2,
            //             child: Container(
            //               padding: const EdgeInsets.symmetric(
            //                   horizontal: 20, vertical: 15),
            //               margin: const EdgeInsets.symmetric(vertical: 10),
            //               decoration: BoxDecoration(
            //                 color: MyColors.black,
            //                 borderRadius: BorderRadius.circular(30),
            //               ),
            //               child: ConstrainedBox(
            //                 constraints: BoxConstraints(
            //                     minHeight: 30,
            //                     maxHeight: 50,
            //                     minWidth: double.infinity,
            //                     maxWidth: double.infinity),
            //                 child: MyText(
            //                   alien: TextAlign.start,
            //                   title: "+966",
            //                   color: MyColors.white,
            //                   size: 13,
            //                 ),
            //               ),
            //             ),
            //           )
            //         ],
            //       ),
            //       BuildFormText(text: "ساعات العمل من"),
            //       IconTextFiled(
            //         hint: "ساعات العمل من",
            //         controller: companyEditProfileData.workHoursFrom,
            //         action: TextInputAction.next,
            //         type: TextInputType.emailAddress,
            //         suffixIcon: Icon(
            //           Icons.edit,
            //           size: 20,
            //         ),
            //         margin: const EdgeInsets.symmetric(vertical: 10),
            //         validate: (value) => value!.validateEmpty(context),
            //       ),
            //       BuildFormText(text: "ساعات العمل الي"),
            //       IconTextFiled(
            //         hint: "ساعات العمل الي",
            //         controller: companyEditProfileData.workHoursTo,
            //         action: TextInputAction.next,
            //         type: TextInputType.emailAddress,
            //         suffixIcon: Icon(
            //           Icons.edit,
            //           size: 20,
            //         ),
            //         margin: const EdgeInsets.symmetric(vertical: 10),
            //         validate: (value) => value!.validateEmpty(context),
            //       ),
            //       BuildFormText(text: "الحالة"),
            //       IconTextFiled(
            //         hint: "الحالة",
            //         controller: companyEditProfileData.branchStatus,
            //         action: TextInputAction.next,
            //         type: TextInputType.emailAddress,
            //         suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
            //         margin: const EdgeInsets.symmetric(vertical: 10),
            //         validate: (value) => value!.validateEmpty(context),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //     ],
            //   ),
            //   replacement: Container(
            //     margin: const EdgeInsets.symmetric(vertical: 5),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
