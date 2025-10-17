import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  final String selectedSize;
  final Function(String) onSizeChanged;

  const SizeSelector({
    super.key,
    required this.selectedSize,
    required this.onSizeChanged,
  });

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Выберите размер:', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSizeButton('Маленькая'),
            SizedBox(width: 20),
            _buildSizeButton('Средняя'),
            SizedBox(width: 20),
            _buildSizeButton('Большая'),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () {
        widget.onSizeChanged(size);
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.selectedSize == size
            ? Colors.blue
            : Colors.grey,
        foregroundColor: widget.selectedSize == size
            ? Colors.white
            : Colors.black,
      ),
      child: Text(size),
    );
  }
}
