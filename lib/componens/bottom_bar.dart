import 'package:ada_kost/componens/layout.dart';
import 'package:ada_kost/helper/locator.dart';
import 'package:ada_kost/helper/navigator_service.dart';
import 'package:ada_kost/screen/homescreen/home_kost.dart';
import 'package:ada_kost/screen/profilescreen/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selected = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
       currentIndex: _selected, // Menunjukkan item yang aktif
        onTap: (index) {
          setState(() {
            _selected = index; // Mengubah indeks saat diklik
          });
        },
        selectedItemColor: Colors.blue, // Warna teks saat dipilih
        unselectedItemColor: Colors.grey, // W
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                // locator<NavigatorService>().navigateTo('setting_group_add');
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Layout()));
              },
              color: Color(0xFF000000),
              icon: const Icon(Icons.search),
            ),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                // locator<NavigatorService>().navigateTo('home_pemesanan');
              },
              color: Color(0xFF000000),
              icon: const Icon(Icons.maps_home_work),
            ),
          ),
          label: 'Pesanan',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              color: Color(0xFF000000),
              icon: const Icon(Icons.person),
            ),
          ),
          label: 'Akun',
        ),
      ],
      // currentIndex: _selected,
      // selectedItemColor: Colors.blue, // Warna item yang dipilih
      // unselectedItemColor: Colors.grey,// Warna item yang tidak dipilih
      // onTap: _onItemTapped,
    );
  }
}

// class BottomBar extends StatefulWidget{
//     _BottomBarState createState() => _BottomBarState();

// }

// class _BottomBarState extends StatefulWidget {
 
//   int _selcted = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(items: [
//       BottomNavigationBarItem(
//         icon: Padding(
//           padding: EdgeInsets.all( 10),
//           child: IconButton(
//             onPressed: () {
//               // locator<NavigatorService>().navigateTo('setting_group_add');
//               Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => Layout()));
//             },
//             color: Color(0xFF000000),
//             icon: const Icon(Icons.search),
//           ),
//         ),
//         label: 'Search',
//       ),
//       BottomNavigationBarItem(
//         icon: Padding(
//           padding: EdgeInsets.all( 10),
//           child: IconButton(
//             onPressed: () {
//               // locator<NavigatorService>().navigateTo('home_pemesanan');
//             },
//             color: Color(0xFF000000),
//             icon: const Icon(Icons.maps_home_work),
//           ),
//         ),
//         label: 'Pesanan',
//       ),
//       BottomNavigationBarItem(
//         icon: Padding(
//           padding: EdgeInsets.all(10),
//           child: IconButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => ProfileScreen()));
//             },
//             color: Color(0xFF000000),
//             icon: const Icon(Icons.person),
//           ),
//         ),
//         label: 'Akun',
//       ),
//     ],
    
//     );
//   }
// }

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
