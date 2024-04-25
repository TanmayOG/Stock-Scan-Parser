import 'package:fitpage_challenge/model/criteria_data_model.dart';
import 'package:fitpage_challenge/pages/indicator_type_page.dart';
import 'package:fitpage_challenge/pages/value_type_page.dart';
import 'package:fitpage_challenge/utils/color_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SubCriteriaWidget{

static Widget buildCriteriaHeader(Size size, CriteriaDataModel criteriaData) {
      return Container(
      height: size.height * 0.1,
      alignment: Alignment.center,
      color: const Color(0xff1686b0),
      child: ListTile(
        title: Text(
          criteriaData.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        subtitle: Text(
          criteriaData.tag,
          style: TextStyle(
            color: Utils.getColorFromCriteria(criteriaData.color),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

static Widget buildCriteriaList(
      Size size, CriteriaDataModel criteriaData, BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 15, right: 8, left: 8),
        itemCount: criteriaData.criteria.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var data = criteriaData.criteria[index];
          return buildCriteriaItem(data, context, criteriaData, index);
        },
      ),
    );
  }

static Widget buildCriteriaItem(
      dynamic data, BuildContext context, CriteriaDataModel criteriaData, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: 'Times',
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
              children: buildTextSpans(data.text, data.variable, context, criteriaData),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (index != criteriaData.criteria.length - 1)
          const Text(
            'and',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        const SizedBox(height: 10),
      ],
    );
  }

static List<TextSpan> buildTextSpans(String text, Map<String, dynamic>? variable,
      BuildContext context, CriteriaDataModel criteriaData) {
    final List<TextSpan> textSpans = [];
    final RegExp regExp = RegExp(r'\$(\d+)');
    int lastIndex = 0;
    for (final match in regExp.allMatches(text)) {
      final variableIndex = int.tryParse(match.group(1) ?? '');
      if (variableIndex != null &&
          variable != null &&
          variable.containsKey('\$$variableIndex')) {
        if (match.start > lastIndex) {
          textSpans.add(
            TextSpan(text: text.substring(lastIndex, match.start)),
          );
        }
        textSpans.add(
          TextSpan(
            text: match.group(0),
            style: const TextStyle(
              color: Colors.indigo,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                final dynamic value = variable['\$$variableIndex'];
                if (value['type'] == 'value') {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VariablePage(
                      variableList: value['values']
                          .map((e) => e.toString())
                          .toList(),
                    ),
                  ));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => IndicatorTypePage(
                      data: value,
                    ),
                  ));
                }
              },
          ),
        );
        lastIndex = match.end;
      }
    }
    if (lastIndex < text.length) {
      textSpans.add(
        TextSpan(text: text.substring(lastIndex)),
      );
    }

    return textSpans;
  }

}