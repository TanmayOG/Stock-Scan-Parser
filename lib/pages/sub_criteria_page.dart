import 'package:fitpage_challenge/model/criteria_data_model.dart';
import 'package:fitpage_challenge/widgets/custom_container_components.dart.dart';
import 'package:fitpage_challenge/widgets/sub_criteria_widget.dart';
import 'package:flutter/material.dart';

class SubCriteriaPage extends StatelessWidget {
  final CriteriaDataModel criteriaData;
  const SubCriteriaPage({super.key, required this.criteriaData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: CustomContainer(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SubCriteriaWidget.buildCriteriaHeader(size, criteriaData),
                SubCriteriaWidget.buildCriteriaList(
                    size, criteriaData, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
