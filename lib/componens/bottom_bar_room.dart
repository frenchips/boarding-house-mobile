import 'package:ada_kost/helper/locator.dart';
import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/model/roomrequest/room_request_delete.dart';
import 'package:ada_kost/screen/roomscreen/room_screen_body_add.dart';
import 'package:ada_kost/screen/roomscreen/room_screen_body_delete.dart';
import 'package:flutter/material.dart';

class BottomBarRoom extends StatelessWidget {
  BottomBarRoom({
    super.key,
    required this.getRequest,
  });

  // final String getNo;
  final RoomDeleteRequest getRequest;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width * 0.05, // 5% dari lebar layar
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: IconButton(
            onPressed: () {
              // locator<NavigatorService>().navigateTo('setting_group_add');
              // showDialog(context: context, builder:  (context) => RoomDeleteBloc(setNo: getId),);
              // Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(builder: (context) => RoomAddBloc()));

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RoomAddBloc()));
            },
            color: Color(0xFF000000),
            icon: const Icon(Icons.add),
          ),
        ),
        label: 'Add',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {
              // locator<NavigatorService>().navigateTo('home_pemesanan');
            },
            color: Color(0xFF000000),
            icon: const Icon(Icons.border_color),
          ),
        ),
        label: 'Update',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {
              // locator<NavigatorService>().navigateTo('profile_screen');
              showDialog(context: context, builder: (context) => RoomDeleteBloc(request: getRequest),);
            },
            color: Color(0xFF000000),
            icon: const Icon(Icons.delete_forever),
          ),
        ),
        label: 'Delete',
      ),
    ]);
  }
}

// Widget BottomBar(){
//   return BottomAppBar(

//     child: Row(
//       children: [
//         Container(
//           child: Icon(Icons.home),
//         ),

//         Container(
//           child: Icon(Icons.search),
//         ),

//         Container(child: Icon(Icons.maps_home_work_rounded),)
//       ],
//     ),
//   );
// }
