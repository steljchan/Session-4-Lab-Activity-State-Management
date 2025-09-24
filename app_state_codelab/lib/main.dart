import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

/// MODEL
class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}

/// ROOT APP
class MyApp extends StatelessWidget {
  MyApp({super.key}); // pakai super.key

  final CounterModel model = CounterModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: model,
      child: MaterialApp(
        title: 'Scoped Model Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}

/// HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scoped Model Example - Home')),
      body: const CounterWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SecondScreen()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

/// COUNTER WIDGET (UI)
class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${model.counter}', // biar test bisa detect angka langsung
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: model.increment,
              child: const Icon(Icons.add), // diganti jadi Icon biar test jalan
            ),
            ElevatedButton(
              onPressed: model.decrement,
              child: const Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed: model.reset,
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}

/// SECOND SCREEN
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scoped Model Example - Second Screen")),
      body: const CounterWidget(),
    );
  }
}
