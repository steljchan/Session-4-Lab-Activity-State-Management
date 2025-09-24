import 'package:flutter/material.dart';

void main() => runApp(const MyEphemeralApp());

class MyEphemeralApp extends StatelessWidget {
  const MyEphemeralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ephemeral State Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Ephemeral State Example')),
        body: const CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  String _inputText = "";

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
      _inputText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Counter Value: $_counter',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: _increment, child: const Text('Increment')),
          ElevatedButton(onPressed: _reset, child: const Text('Reset')),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: const InputDecoration(labelText: "Enter text"),
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          Text('Input: $_inputText', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
