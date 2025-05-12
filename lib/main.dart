import 'package:ada_kost/componens/layout.dart';
import 'package:ada_kost/helper/locator.dart';
import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/helper/route_generator.dart';
import 'package:ada_kost/screen/pengajuanScreen/pengajuan_screen.dart';
import 'package:ada_kost/screen/roomscreen/room_screen_body_add.dart';
import 'package:ada_kost/screen/training/training_screen.dart';
import 'package:ada_kost/services/testingapi.dart';
// import 'package:ada_kost/screen/profil/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  await initializeDateFormatting('id', null);
  setUpLocator();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigatorService>().navigatorKey,
      home: Layout(),
      // home: PengajuanBody(),
      // home: RoomAddBloc(),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}

