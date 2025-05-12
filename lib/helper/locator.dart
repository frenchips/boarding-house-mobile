import 'package:ada_kost/helper/navigator_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

void setUpLocator(){
  locator.registerLazySingleton(() => NavigatorService());
}