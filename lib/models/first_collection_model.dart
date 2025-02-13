class FirstCollection {
  List<Data>? data;

  FirstCollection({this.data});

  FirstCollection.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? coverImageUrl;

  Data({this.coverImageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    coverImageUrl = json['cover_image_url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cover_image_url'] = this.coverImageUrl;
    return data;
  }
}
