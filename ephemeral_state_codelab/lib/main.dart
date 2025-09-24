import 'package:flutter/material.dart';

void main() => runApp(const MyEphemeralApp());

class MyEphemeralApp extends StatelessWidget {
  const MyEphemeralApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ephemeral State Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Ephemeral State Example')),
        body: const CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Counter Value: $_counter'),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: _increment, child: const Text('Increment')),
        ],
      ),
    );
  }
}
