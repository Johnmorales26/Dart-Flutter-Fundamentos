import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  CounterAppState createState() => CounterAppState();
}

class CounterAppState extends State<CounterApp> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  void multiplyBy2() {
    setState(() {
      counter *= 2;
    });
  }

  void clearCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Callback from the counter control',
                  style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
              const SizedBox(height: 32),
              Text(counter.toString(), style: const TextStyle(fontSize: 45)),
              const SizedBox(height: 56),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        onPressed: clearCounter,
                        child: const Icon(Icons.refresh)),
                    FloatingActionButton(
                        onPressed: multiplyBy2, child: const Icon(Icons.clear)),
                    FloatingActionButton(
                        onPressed: decreaseCounter,
                        child: const Icon(Icons.remove)),
                    FloatingActionButton(
                        onPressed: increaseCounter,
                        child: const Icon(Icons.add))
                  ])
            ]),
      ),
    );
  }
}
