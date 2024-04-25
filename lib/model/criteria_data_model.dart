class CriteriaDataModel {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<CriteriaList> criteria;

  CriteriaDataModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory CriteriaDataModel.fromJson(Map<String, dynamic> json) {
    return CriteriaDataModel(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: json['color'],
      criteria: (json['criteria'] as List)
          .map((criteriaJson) => CriteriaList.fromJson(criteriaJson))
          .toList(),
    );
  }
}

class CriteriaList {
  final String type;
  final String text;
  final Map<String, dynamic>? variable;

  CriteriaList({
    required this.type,
    required this.text,
    this.variable,
  });

  factory CriteriaList.fromJson(Map<String, dynamic> json) {
    return CriteriaList(
      type: json['type'],
      text: json['text'],
      variable: json['variable'],
    );
  }
}
