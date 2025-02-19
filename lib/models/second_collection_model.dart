class SecondCollection {
  List<Data>? data;

  SecondCollection({this.data});

  SecondCollection.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = List<Data>.from(json['data'].map((v) => Data.fromJson(v)));
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((v) => v.toJson()).toList(),
    };
  }
}

class Data {
  Story? story;

  Data({this.story});

  Data.fromJson(Map<String, dynamic> json) {
    story = json['story'] != null ? Story.fromJson(json['story']) : Story();
  }

  Map<String, dynamic> toJson() {
    return {
      'story': story?.toJson(),
    };
  }
}

class Story {
  Item? item;

  Story({this.item});

  Story.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? Item.fromJson(json['item']) : Item();
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item?.toJson(),
    };
  }
}

class Item {
  String? coverSrc;

  Item({this.coverSrc});

  Item.fromJson(Map<String, dynamic> json) {
    coverSrc = json['cover_src'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'coverSrc': coverSrc,
    };
  }
}
