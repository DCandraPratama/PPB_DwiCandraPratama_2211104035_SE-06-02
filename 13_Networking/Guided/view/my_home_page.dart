import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_13/view%20model/counter_controler.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final controller = Get.find<CounterControler>();

  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Obx(
        ()=> Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              controller.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: () {
              Get.toNamed('/Detail');
            }, 
            child: Text('Go to Detail'),
            )
          ],
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: controller.getsnackbar,
            tooltip: 'Snackbar',
            child: const Icon(Icons.chat),
          ),
          FloatingActionButton(
            onPressed: controller.getdialog,
            tooltip: 'dialog',
            child: const Icon(Icons.notifications_active),
          ),
          FloatingActionButton(
            onPressed: controller.getbottomsheet,
            tooltip: 'bottom sheet',
            child: const Icon(Icons.arrow_upward),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}