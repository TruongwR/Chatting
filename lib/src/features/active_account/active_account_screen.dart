import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/cubit/active_account_cubit.dart';
import 'package:Whispers/src/cubit/active_account_state.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:Whispers/src/share_components/app_bar/my_app_bar.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:Whispers/src/utils/until.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/Palette.dart';
import '../../configs/app_fonts.dart';
import '../../di/injection.dart/injection.dart';

class ActiveAccountScreen extends StatefulWidget {
  const ActiveAccountScreen({super.key});

  @override
  State<ActiveAccountScreen> createState() => _ActiveAccountScreenState();
}

class _ActiveAccountScreenState extends State<ActiveAccountScreen> {
  TextEditingController otpAuthenEmailController = TextEditingController();
  final activeAccount = getIt<ActiveAccountCubit>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpAuthenEmailController.dispose();
    activeAccount.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(title: ''),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderText(text: 'Xác thực email'),
              SizedBox(
                child: Center(
                  child: Text(
                    'chúng tôi gửi mã xác thực tới email của bạn.',
                    style: AppFont.t.s(18).w500,
                  ),
                ),
              ),
              BoxMain.h(20),
              MyTextField(
                style: AppFont.t.s(16).grey68.w600,
                controller: otpAuthenEmailController,
                hintText: 'Nhập mã xác thực email',
                hintStyle: AppFont.t.s(16).grey68,
                hasBorder: true,
                inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.grayBE),
                ),
              ),
              BoxMain.h(8),
              InkWell(
                child: Text(
                  'Gửi lại mã xác thực',
                  style: AppFont.t.s(16).underline.blue007EB8.w500,
                  textAlign: TextAlign.left,
                ),
              ),
              BoxMain.h(30),
              BlocListener<ActiveAccountCubit, ActiveAccountState>(
                bloc: activeAccount,
                listener: (context, state) {
                  Logger.d('status', state.toString());
                  state.whenOrNull(
                      loading: showLoading,
                      succes: () {
                        dismissLoading();
                        AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
                      },
                      failure: dismissLoadingShowError);
                },
                child: ButtonPrimary(
                    text: "Tiếp Tục",
                    textStyle: AppFont.t.s(24).w600.white,
                    action: () {
                      if (otpAuthenEmailController.text != '') {
                        String stringWithSlash = otpAuthenEmailController.text;
                        int slashIndex = stringWithSlash.indexOf("/");
                        String firstString = stringWithSlash.substring(0, slashIndex);
                        String secondString = stringWithSlash.substring(slashIndex + 1);
                        activeAccount.activeAccount(id: firstString, activationCode: secondString);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
