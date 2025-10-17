import 'package:flutter/material.dart';

class ExtraOptions extends StatefulWidget {
  final bool urgent;
  final Function(bool) onUrgentChanged;

  const ExtraOptions({
    super.key,
    required this.urgent,
    required this.onUrgentChanged,
  });

  @override
  State<ExtraOptions> createState() => _ExtraOptionsState();
}

class _ExtraOptionsState extends State<ExtraOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Дополнительные опции:', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        Column(
          children: [
            Text(
              'Срочный заказ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildUrgentButton(true),
                SizedBox(width: 20),
                _buildUrgentButton(false),
              ],
            ),
            SizedBox(height: 20),
            Text(
              widget.urgent
                  ? 'Вы выбрали: Срочный заказ'
                  : 'Вы выбрали: Обычный заказ',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUrgentButton(bool urgent) {
    return ElevatedButton(
      onPressed: () {
        widget.onUrgentChanged(urgent);
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.urgent && urgent
            ? Colors.green
            : !widget.urgent && !urgent
            ? Colors.red
            : Colors.grey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(urgent ? 'Да' : 'Нет'),
    );
  }
}
