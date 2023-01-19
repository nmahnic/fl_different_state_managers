import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../common/count_use_case.dart';
import '../common/counter_service.dart';
import 'my_provider.dart';


class ProviderScreen extends StatelessWidget {
  const ProviderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider(
            counterUseCase: CountUseCase(
              repository: CounterService()
            )
          )
        ),
      ],
      child: const _ProviderContent(),
    );
  }
}

class _ProviderContent extends StatelessWidget {
  const _ProviderContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: _BlocPatternBody(provider: provider),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await provider.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _BlocPatternBody extends StatelessWidget {
  const _BlocPatternBody({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final MyProvider provider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the button this many times:',),
          AnimatedBuilder(
            animation: provider,
            builder:(context, _) { 
              return Text(
                '${provider.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }
          ),
        ],
      ),
    );
  }
}
