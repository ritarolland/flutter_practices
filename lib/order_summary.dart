import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final String size;
  final String dough;
  final List<String> toppings;
  final bool urgent;

  const OrderSummary({
    super.key,
    required this.size,
    required this.dough,
    required this.toppings,
    required this.urgent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ваш заказ:',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text('Размер: $size', style: TextStyle(fontSize: 18)),
        Text('Тесто: $dough', style: TextStyle(fontSize: 18)),
        Text(
          'Начинка: ${toppings.isEmpty ? "нет" : toppings.join(", ")}',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        if (urgent)
          Text(
            '!СРОЧНЫЙ ЗАКАЗ!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: Text('Подтвердить заказ'),
        ),
      ],
    );
  }
}
