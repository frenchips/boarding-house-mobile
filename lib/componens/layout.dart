import 'package:ada_kost/componens/bottom_bar.dart';
import 'package:ada_kost/model/roomrequest/room_request_search.dart';
import 'package:ada_kost/screen/homescreen/home_kost.dart';
import 'package:ada_kost/screen/pengajuanScreen/pengajuan_screen.dart';
import 'package:ada_kost/screen/roomscreen/room_screen.dart';
import 'package:ada_kost/screen/roomscreen/room_screen_body_add.dart';
import 'package:ada_kost/state_management/blocroom/bloc_room.dart';
import 'package:ada_kost/state_management/blocroom/event_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'ADA KOST',
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xFF15B392),
      ),
      body: const LayoutBody(),
      // body: MultiBlocProvider(
      //   providers: [
      //     BlocProvider(
      //       create: (context) => RoomBloc()..add(ViewRoomData(req)),
      //     ),
      //   ],
      //   child: const RoomScreen(),
      // ),
      bottomNavigationBar:BottomBar()
      
    );
  }
}

class LayoutBody extends StatefulWidget {
  const LayoutBody({super.key});

  @override
  State<LayoutBody> createState() => _LayoutBodyState();
}

class _LayoutBodyState extends State<LayoutBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBlocView(),
      // body: PengajuanBody(),
    );
  }
}
