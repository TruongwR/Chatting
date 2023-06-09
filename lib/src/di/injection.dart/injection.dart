import 'package:Whispers/src/cubit/active_account_cubit.dart';
import 'package:Whispers/src/cubit/check_messages_cubit.dart';
import 'package:Whispers/src/cubit/create_chanel_cubit.dart';
import 'package:Whispers/src/cubit/edit_profile_cubit.dart';
import 'package:Whispers/src/cubit/fotget_password_cubit.dart';
import 'package:Whispers/src/cubit/get_list_member_chanel_cubit.dart';
import 'package:Whispers/src/cubit/get_new_password_cubit.dart';
import 'package:Whispers/src/cubit/login_cubit_cubit.dart';
import 'package:Whispers/src/cubit/update_chanel_cubit.dart';
import 'package:Whispers/src/cubit/update_member_channel_cubit.dart';
import 'package:Whispers/src/di/modules/repository_modules.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../cubit/chanel_list_all_cubit.dart';
import '../../cubit/detail_chanel_cubit.dart';

import '../../cubit/seen_message_cubit.dart';
import '../../cubit/signup_cubit.dart';
import '../../data/data_sources/local/app_data.dart';
import '../../utils/helpers/socket_helper.dart';
import '../modules/api_modules.dart';
import '../modules/component_modules.dart';
import '../modules/cubit_modules.dart';

GetIt getIt = GetIt.I;

abstract class DIModule {
  void provider();
}

class Injection {
  static Future<void> inject() async {
    await ApiModule().provider();
    await ComponentModules().provider();
    await RepositoryMoudules().provider();
    await CubitModule().provider();
  }

  static final List<BlocProvider> cubitProvider = [
    BlocProvider<LoginCubitCubit>(create: (context) => getIt<LoginCubitCubit>()),
    BlocProvider<FotgetPasswordCubit>(create: (context) => getIt<FotgetPasswordCubit>()),
    BlocProvider<GetNewPasswordCubit>(create: (context) => getIt<GetNewPasswordCubit>()),
    BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
    BlocProvider<ActiveAccountCubit>(create: (context) => getIt<ActiveAccountCubit>()),
    BlocProvider<EditProfileCubit>(create: (context) => getIt<EditProfileCubit>()),
    BlocProvider<ChanelListAllCubit>(create: (context) => getIt<ChanelListAllCubit>()),
    BlocProvider<DetailChanelCubit>(create: (context) => getIt<DetailChanelCubit>()),
    BlocProvider<CheckMessagesCubit>(create: (context) => getIt<CheckMessagesCubit>()),
    BlocProvider<CreateChanelCubit>(create: (context) => getIt<CreateChanelCubit>()),
    BlocProvider<UpdateChanelCubit>(create: (context) => getIt<UpdateChanelCubit>()),
    BlocProvider<UpdateMemberChannelCubit>(create: (context) => getIt<UpdateMemberChannelCubit>()),
    BlocProvider<GetListMemberChanelCubit>(create: (context) => getIt<GetListMemberChanelCubit>()),
    BlocProvider<SeenMessageCubit>(create: (context) => getIt<SeenMessageCubit>()),
  ];
}

AppData get appData => getIt<AppData>();
SocketHelper get socketHelper => getIt<SocketHelper>();
