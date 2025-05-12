import 'package:ada_kost/helper/locator.dart';
import 'package:ada_kost/helper/navigator_service.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<SecondPage> {
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is your 2st page', style: TextStyle(fontSize: 18),
            ),
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineLarge,),
            ElevatedButton(onPressed: (){
              locator<NavigatorService>().navigateTo('first_page');
            }, child: Text('To first page'), ), 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: Icon(Icons.add),),
    );
  }
}