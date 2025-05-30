class ProductAttributeModel {
  String? name;
  List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    return ProductAttributeModel(
      name: document['Name']?.toString() ?? '',
      values: (document['Values'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}