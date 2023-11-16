import 'package:flutter/material.dart';
import 'package:uniconverter_app/widgets/type_conversion_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffB23A48)),
        useMaterial3: true,
      ),
      home: const UniConverterScreen(),
    );
  }
}

class UniConverterScreen extends StatefulWidget {
  const UniConverterScreen({super.key});

  @override
  State<StatefulWidget> createState() => UniConverterState();
}

class UniConverterState extends State<UniConverterScreen> {
  final TextEditingController _valueConverter = TextEditingController();
  final TextEditingController _onzaFuerzaValue = TextEditingController();
  final TextEditingController _gramoFuerzaValue = TextEditingController();
  final TextEditingController _kilonewtonValue = TextEditingController();
  final TextEditingController _libraFuerzaValue = TextEditingController();
  final TextEditingController _kilogramoFuerzaValue = TextEditingController();
  final TextEditingController _dinaValue = TextEditingController();

  void _converterUnits() {
    var valueConverter = double.parse(_valueConverter.text);
    setState(() {
      _onzaFuerzaValue.text = (valueConverter * 3.59694).toString();
      _gramoFuerzaValue.text = (valueConverter * 101.97).toString();
      _kilonewtonValue.text = (valueConverter * 0.001).toString();
      _libraFuerzaValue.text = (valueConverter * 0.22).toString();
      _kilogramoFuerzaValue.text = (valueConverter * 0.1).toString();
      _dinaValue.text = (valueConverter * 100000).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uni Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffB23A48),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [TypeConversionWidget()],
              ),
              const SizedBox(height: 38),
              const Text('Entrada',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              TextField(
                controller: _valueConverter,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Newtons'),
              ),
              const SizedBox(height: 16),
              const Text('Resultado',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              ListTile(
                title: const Text('Onza Fuerza'),
                subtitle: const Text('0.28 N'),
                leading: const Text('ozf'),
                trailing: Text(_onzaFuerzaValue.text),
              ),
              ListTile(
                title: const Text('Gramo Fuerza'),
                subtitle: const Text('0.01 N'),
                leading: const Text('gf'),
                trailing: Text(_gramoFuerzaValue.text),
              ),
              ListTile(
                title: const Text('Kilonewton'),
                subtitle: const Text('1,000 N'),
                leading: const Text('kN'),
                trailing: Text(_kilonewtonValue.text),
              ),
              ListTile(
                title: const Text('Libra Fuerza'),
                subtitle: const Text('4.45 N'),
                leading: const Text('lbf'),
                trailing: Text(_libraFuerzaValue.text),
              ),
              ListTile(
                title: const Text('Kilogramo Fuerza'),
                subtitle: const Text('9.81 N'),
                leading: const Text('kgf'),
                trailing: Text(_kilogramoFuerzaValue.text),
              ),
              ListTile(
                title: const Text('Dina'),
                subtitle: const Text('1.00E-5 N'),
                leading: const Text('dyn'),
                trailing: Text(_dinaValue.text),
              )
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _converterUnits();
        },
        label: const Text('Convertir'),
        icon: const Icon(Icons.transform),
      ),
    );
  }
}
