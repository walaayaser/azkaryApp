class AzkarModel {
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<AzkarContentModel>? array;

  AzkarModel({this.id, this.category, this.audio, this.filename, this.array});

  AzkarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    audio = json['audio'];
    filename = json['filename'];
    if (json['array'] != null) {
      array = <AzkarContentModel>[];
      json['array'].forEach((v) {
        array!.add( AzkarContentModel.fromJson(v));
      });
    }
  }


}

class AzkarContentModel {
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;

  AzkarContentModel(
      {this.id, this.text, this.count, this.audio, this.filename});

  AzkarContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    count = json['count'];
    audio = json['audio'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['count'] = count;
    data['audio'] = audio;
    data['filename'] = filename;
    return data;
  }
}
