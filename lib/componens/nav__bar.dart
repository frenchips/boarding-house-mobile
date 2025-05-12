import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFFFFBE6),
        child:  ListView(
        padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 60),
        children: <Widget>[
          // DrawerHeader(
          //   decoration: const BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: const [
          //       Text(
          //         'Sidebar',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 24,
          //         ),
          //       ),
          //       Text(
          //         'Sidebar',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 14,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Text('Home'),
          ListTile(
            // leading: const Icon(Icons.home),
            title: Text('Beranda',  style: TextStyle(fontSize: 12),),
            
            onTap: () {
              // Navigate to home screen
            },
          ),

          // padding: const EdgeInsets.symmetric(vertical: 1),
          ListTile(
            // leading: const Icon(Icons.home),
            title: Text('Parameter'),
            onTap: () {
              // Navigate to home screen
            },
          ),
          ListTile(
            // leading: const Icon(Icons.home),
            title: Text('Kamar'),
            onTap: () {
              // Navigate to home screen
            },
          ),
          ListTile(
            // leading: const Icon(Icons.home),
            title: Text('Pengajuan Sewa'),
            onTap: () {
              // Navigate to home screen
            },
          ),
          ListTile(
            // leading: const Icon(Icons.home),
            title: Text('Manajemen Kost'),
            onTap: () {
              // Navigate to home screen
            },
          ),
          ListTile(
            // leading: const Icon(Icons.home),
            title: Text('Riwayat Pengajuan Sewa'),
            onTap: () {
              // Navigate to home screen
            },
          ),
          ListTile(
            // leading: const Icon(Icons.home),
            title: Text('Riwayat Pembayaran Sewa'),
            onTap: () {
              // Navigate to home screen
            },
          ),
                    ListTile(
            // leading: const Icon(Icons.home),
            title: Text('Laporan Pembayaran Sewa'),
            onTap: () {
              // Navigate to home screen
            },
          ),
        ],
      ),
      )
     
    );
  }
}
