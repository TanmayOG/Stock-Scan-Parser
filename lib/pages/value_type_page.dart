import 'package:fitpage_challenge/widgets/custom_container_components.dart.dart';
import 'package:fitpage_challenge/utils/dotted_divder_utils.dart';
import 'package:flutter/material.dart';

class VariablePage extends StatelessWidget {
  final List variableList;
  const VariablePage({super.key, required this.variableList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomContainer(
          child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: variableList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                variableList[index],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              if (index != variableList.length - 1)
            
                DottedDivider(
                  color: Colors.white,
                ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      )),
    ));
  }

}
