class Regions {
  List<Region>? region;

  Regions({this.region});

  Regions.fromJson(Map<String, dynamic> json) {
    if (json['region'] != null) {
      region = new List<Region>.empty();
      json['region'].forEach((v) {
        region?.add(new Region.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.region != null) {
      data['region'] = this.region?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;

  Region({this.id, this.name});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
