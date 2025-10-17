import 'package:flutter/material.dart';
import 'package:practice1/size_selector.dart';
import 'package:practice1/toppings_selector.dart';
import 'dough_selector.dart';
import 'extra_options.dart';
import 'order_summary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PizzaApp(),
    );
  }
}

class PizzaApp extends StatefulWidget {
  const PizzaApp({super.key});

  @override
  State<PizzaApp> createState() => _PizzaAppState();
}

class _PizzaAppState extends State<PizzaApp> {
  int _currentScreen = 0;

  String _selectedSize = 'Средняя';
  String _selectedDough = 'Тонкое';
  List<String> _selectedToppings = [];
  bool _urgent = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      SizeSelector(
        selectedSize: _selectedSize,
        onSizeChanged: (size) => setState(() => _selectedSize = size),
      ),
      DoughSelector(
        selectedDough: _selectedDough,
        onDoughChanged: (dough) => setState(() => _selectedDough = dough),
      ),
      ToppingsSelector(
        selectedToppings: _selectedToppings,
        onToppingsChanged: (toppings) =>
            setState(() => _selectedToppings = toppings),
      ),
      ExtraOptions(
        urgent: _urgent,
        onUrgentChanged: (urgent) => setState(() => _urgent = urgent),
      ),
      OrderSummary(
        size: _selectedSize,
        dough: _selectedDough,
        toppings: _selectedToppings,
        urgent: _urgent,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Сборщик пиццы',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(child: screens[_currentScreen]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _currentScreen > 0
                  ? () => setState(() => _currentScreen--)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Назад'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _currentScreen < screens.length - 1
                  ? () => setState(() => _currentScreen++)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Вперед'),
            ),
          ],
        ),
      ),
    );
  }
}
