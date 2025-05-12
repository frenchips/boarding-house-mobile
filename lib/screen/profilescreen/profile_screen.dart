import 'package:ada_kost/componens/bottom_bar.dart';
import 'package:ada_kost/helper/locator.dart';
import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/model/roomrequest/room_request_delete.dart';
import 'package:ada_kost/model/roomrequest/room_request_search.dart';
import 'package:ada_kost/screen/parameterscreen/parameter_screen.dart';
import 'package:ada_kost/screen/roomscreen/room_screen.dart';
import 'package:ada_kost/screen/roomscreen/room_screen_body.dart';
import 'package:ada_kost/state_management/blocroom/bloc_room.dart';
import 'package:ada_kost/state_management/blocroom/event_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // RoomSearchRequest req = RoomSearchRequest.initial();
  RoomDeleteRequest reqDel = RoomDeleteRequest();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(),
        appBar: AppBar(
          title: Text('Kepemilikan'),
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Text('Some Content Above'),  
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true, // Menyesuaikan tinggi GridView
                physics:
                    NeverScrollableScrollPhysics(), // Disable scroll GridView
                children: [
                  InkWell(
                    onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ParameterScreen()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      // color: Colors.white,
                      child: Center(
                        child: Text(
                          'Parameter ',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                        // reqDel.listDelete!.map((element) => element.no );
                        // Navigator.pushReplacement(
                        // context,
                        // MaterialPageRoute(builder: (context) => RoomScreenView()));
                        locator<NavigatorService>().navigateTo('room_screen_body');
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      // color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.home, size: 40,),
                            Text(
                              'Kamar ',
                              // style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      // color: Colors.white,
                      child: Center(
                        child: Text(
                          'Pengajuan Sewa ',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      // color: Colors.white,
                      child: Center(
                        child: Text(
                          'Manajemen Kost ',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      // color: Colors.white,
                      child: Center(
                        child: Text(
                          'Riwayat Pengajuan Sewa ',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      // color: Colors.white,
                      child: Center(
                        child: Text(
                          'Riwayat Pembayaran Sewa ',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      // color: Colors.white,
                      child: Center(
                        child: Text(
                          'Laporan Pembayaran Sewa ',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // Text('Some Content Below'),
            ],
          ),
        ),
      );
  }
}
