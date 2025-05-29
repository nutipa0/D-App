import 'package:flutter/material.dart';

class MyAnotherTextField extends StatefulWidget {
  const MyAnotherTextField({super.key});

  @override
  State<MyAnotherTextField> createState() => _MyAnotherTextFieldState();
}

class _MyAnotherTextFieldState extends State<MyAnotherTextField> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    List<String> items = ['apple', 'banana', 'cherry'];
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Выберите фрукт',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.arrow_drop_down),
      ), // Иконка справа
      value: selectedValue,
      items:
          items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
