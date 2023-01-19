import 'package:fl_provider_or_bloc/common/counter_service.dart';
import 'package:flutter/material.dart';

import '../common/dialog.dart';

class NoneScreen extends StatefulWidget {
  const NoneScreen({super.key});

  @override
  State<NoneScreen> createState() => _NoneScreenState();
}

class _NoneScreenState extends State<NoneScreen> {
  int _counter = 0;
  final CounterRepository service = CounterService();

  void _incrementCounter() async {
    _counter = await service.proccess(_counter);
  
    if( (_counter > 0) && ((_counter % 5) == 0) ){
      customDialog(context);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Don't do this"),
      ),
      body: _NoneBody(counter: _counter),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _NoneBody extends StatelessWidget {
  const _NoneBody({
    Key? key,
    required int counter,
  }) : _counter = counter, super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:',),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
