import 'package:fitpage_challenge/widgets/custom_container_components.dart.dart';
import 'package:fitpage_challenge/utils/text_utils.dart';
import 'package:fitpage_challenge/widgets/parameter_input_field.dart';
import 'package:flutter/material.dart';

class IndicatorTypePage extends StatelessWidget {
  final Map<String, dynamic> data;

  const IndicatorTypePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final TextEditingController parameterController = TextEditingController()
      ..text = data['default_value'].toString();

    return SafeArea(
      child: Scaffold(
        body: CustomContainer(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextUtils.toUpperCase(data['study_type']),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Set Parameter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),
               ParameterInputField(
                  controller: parameterController,
                  minValue: data['min_value'],
                  maxValue: data['max_value'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

// Constants

