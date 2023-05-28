import '../../data/remote/authentication_api.dart';
import '../../network/base_dio.dart';
import '../injection.dart/injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provider() async {
      getIt.registerSingleton(BaseDio.instance.dio);
    getIt.registerSingleton(AuthenticationApi(BaseDio.instance.dio));
  }
}