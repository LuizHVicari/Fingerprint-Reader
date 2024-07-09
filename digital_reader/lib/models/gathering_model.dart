class GatheringModel {
  int? id;
  String? fingerprint;
  int? baby;
  int? months;
  String? createdAt;
  String? updatedAt;

  GatheringModel(
      {this.id,
      this.fingerprint,
      this.baby,
      this.months,
      this.createdAt,
      this.updatedAt});

  GatheringModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fingerprint = json['fingerprint'];
    baby = json['baby'];
    months = json['months'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fingerprint'] = fingerprint;
    data['baby'] = baby;
    data['months'] = months;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
