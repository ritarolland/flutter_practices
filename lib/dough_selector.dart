import 'package:flutter/material.dart';

class DoughSelector extends StatefulWidget {
  final String selectedDough;
  final Function(String) onDoughChanged;

  const DoughSelector({
    super.key,
    required this.selectedDough,
    required this.onDoughChanged,
  });

  @override
  State<DoughSelector> createState() => _DoughSelectorState();
}

class _DoughSelectorState extends State<DoughSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Выберите тесто:', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDoughButton('Тонкое'),
            SizedBox(width: 20),
            _buildDoughButton('Толстое'),
            SizedBox(width: 20),
            _buildDoughButton('Сырный бортик'),
          ],
        ),
      ],
    );
  }

  Widget _buildDoughButton(String dough) {
    return ElevatedButton(
      onPressed: () {
        widget.onDoughChanged(dough);
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.selectedDough == dough
            ? Colors.blue
            : Colors.grey,
        foregroundColor: widget.selectedDough == dough
            ? Colors.white
            : Colors.black,
      ),
      child: Text(dough),
    );
  }
}
