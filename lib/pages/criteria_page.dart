import 'package:fitpage_challenge/widgets/custom_container_components.dart.dart';
import 'package:fitpage_challenge/pages/sub_criteria_page.dart';
import 'package:fitpage_challenge/services/criteria_provider.dart';
import 'package:fitpage_challenge/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CriteriaPage extends StatefulWidget {
  const CriteriaPage({super.key});

  @override
  State<CriteriaPage> createState() => _CriteriaPageState();
}

class _CriteriaPageState extends State<CriteriaPage> {
  @override
  void initState() {
    Provider.of<CriteriaDataProvider>(context, listen: false)
        .fetchCriteriaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var criteriaData = Provider.of<CriteriaDataProvider>(context).data;

    return SafeArea(
        child: Scaffold(
      body: CustomContainer(
          child: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: criteriaData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String color = criteriaData[index].color;
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SubCriteriaPage(criteriaData: criteriaData[index])));
            },
            title: Text(
              criteriaData[index].name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
            subtitle: Text(
              criteriaData[index].tag,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  color: Utils.getColorFromCriteria(color),
                  fontWeight: FontWeight.normal),
            ),
          );
        },
      )),
    ));
  }
}
