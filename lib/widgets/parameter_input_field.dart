import 'package:flutter/material.dart';

class ParameterInputField extends StatelessWidget {
  final TextEditingController controller;
  final int minValue;
  final int maxValue;

  const ParameterInputField({
    super.key,
    required this.controller,
    required this.minValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      height: 100, 
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Parameter', 
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter Parameter",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
                }
                final parsedValue = int.tryParse(value) ?? 0;
                if (parsedValue < minValue || parsedValue > maxValue) {
                  return 'Value must be between $minValue and $maxValue';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
