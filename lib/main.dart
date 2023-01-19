import 'package:flutter/material.dart';

import '_bloc_pattern/bloc_pattern_screen.dart';
import '_bloc_pattern_inherited/bloc_pattern_inherited_screen.dart';
import '_package_flutter_bloc/bloc_screen.dart';
import '_none/none_screen.dart';
import '_package_provider/provider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home':                   ( _ ) => const HomeScreen(),
        'none':                   ( _ ) => const NoneScreen(),
        'bloc_pattern':           ( _ ) => BlocPatternScreen(),
        'bloc_pattern_inherited': ( _ ) => const BlocPatternInheritedScreen(),
        'bloc':                   ( _ ) => const BlocScreen(),
        'provider':               ( _ ) => const ProviderScreen()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Managers"),
      ),
      body: Column(
        children: [
          Button(
            title: 'None',
            onPress: () => Navigator.pushNamed(context, 'none')
          ),
          Button(
            title: 'Bloc Pattern',
            onPress: () => Navigator.pushNamed(context, 'bloc_pattern')
          ),
          Button(
            title: 'Bloc Pattern with Inherited',
            onPress: () => Navigator.pushNamed(context, 'bloc_pattern_inherited')
          ),
          Button(
            title: 'Provider',
            onPress: () => Navigator.pushNamed(context, 'provider')
          ),
          Button(
            title: 'Bloc',
            onPress: () => Navigator.pushNamed(context, 'bloc')
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.title,
    required this.onPress
  }) : super(key: key);

  // final ValueChanged<void> onPress;
  final VoidCallback onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const SizedBox(height: 30,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
            ),
            onPressed: onPress,
            child: Text(title)
          ),
        ],
      ),
    );
  }
}