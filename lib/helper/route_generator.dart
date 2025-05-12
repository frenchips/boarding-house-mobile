
import 'package:ada_kost/componens/layout.dart';
import 'package:ada_kost/screen/parameterscreen/parameter_screen.dart';
import 'package:ada_kost/screen/roomscreen/room_screen.dart';
import 'package:ada_kost/screen/roomscreen/room_screen_body.dart';
import 'package:ada_kost/screen/training/first_page.dart';
import 'package:ada_kost/screen/homescreen/home_data_diri.dart';
import 'package:ada_kost/screen/homescreen/home_pemesanan.dart';
import 'package:ada_kost/screen/homescreen/home_pendataan.dart';
import 'package:ada_kost/screen/profilescreen/profile_screen.dart';
import 'package:ada_kost/screen/training/second_page.dart';
import 'package:flutter/material.dart';


class RouteGenerator{

 

  static Route<dynamic> generateRoute(RouteSettings settings){
   

    switch(settings.name){
      case 'first_page':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case 'second_page':
        return MaterialPageRoute(builder: (_) => SecondPage());
      case 'layout':
        return MaterialPageRoute(builder: (_) => Layout());
      // case 'home_pemesanan':
      //   return MaterialPageRoute(builder: (_) => OrderScreen());
      // case 'home_pendataan':
      //   return MaterialPageRoute(builder: (_) => PendataanScreen());    
      // case 'home_data_diri':
      //   return MaterialPageRoute(builder: (_) => DataDiriScreen());
      case 'room_screen_body':
        return MaterialPageRoute(builder: (_) => RoomScreenView());   
      case 'room_screen':
        return MaterialPageRoute(builder: (_) => RoomScreen());   
      case 'parameter_screen':
        return MaterialPageRoute(builder: (_) => ParameterScreen());   
      default:
        return _errorRoute();   
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text('This is Error Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Route generator is error, back to first page'),
              Container(margin: EdgeInsets.all(4),),
              GestureDetector(onTap: () {
                // locator<NavigatorService>().navigateReplaceTo('routeName');
              },)
            ],
          ),
        ),
      );
    });
  }
}