class BabyModel {
  int? id;
  String? code;
  String? birthDate;
  String? gender;
  String? createdAt;
  String? updatedAt;

  BabyModel(
      {this.id,
      this.code,
      this.birthDate,
      this.gender,
      this.createdAt,
      this.updatedAt});

  BabyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
