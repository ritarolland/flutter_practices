import 'package:flutter/material.dart';

class ToppingsSelector extends StatefulWidget {
  final List<String> selectedToppings;
  final Function(List<String>) onToppingsChanged;

  const ToppingsSelector({
    super.key,
    required this.selectedToppings,
    required this.onToppingsChanged,
  });

  @override
  State<ToppingsSelector> createState() => _ToppingsSelectorState();
}

class _ToppingsSelectorState extends State<ToppingsSelector> {
  void _toggleTopping(String topping) {
    setState(() {
      final newToppings = List<String>.from(widget.selectedToppings);
      if (newToppings.contains(topping)) {
        newToppings.remove(topping);
      } else {
        newToppings.add(topping);
      }
      widget.onToppingsChanged(newToppings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Выберите начинку:', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              [
                    'Пепперони',
                    'Грибы',
                    'Сыр',
                    'Ветчина',
                    'Ананасы',
                    'Оливки',
                    'Помидоры',
                  ]
                  .map(
                    (topping) => ElevatedButton(
                      onPressed: () => _toggleTopping(topping),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            widget.selectedToppings.contains(topping)
                            ? Colors.blue
                            : Colors.grey,
                        foregroundColor:
                            widget.selectedToppings.contains(topping)
                            ? Colors.white
                            : Colors.black,
                      ),
                      child: Text(topping),
                    ),
                  )
                  .toList(),
        ),
        SizedBox(height: 20),
        Text(
          'Выбрано: ${widget.selectedToppings.join(', ')}',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
