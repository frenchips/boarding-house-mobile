import 'package:ada_kost/helper/locator.dart';
import 'package:ada_kost/helper/navigator_service.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is your 1st page', style: TextStyle(fontSize: 18),
            ),
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineLarge,),
            ElevatedButton(onPressed: (){
              locator<NavigatorService>().navigateTo('second_page');
            }, child: Text('To second page'), ), 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: Icon(Icons.add),),
    );
  }
}