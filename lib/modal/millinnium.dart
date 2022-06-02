class MillinniumModal {
  String? id;
  String? vlVideo;
  String? imagePath;
  String? image;
  String? mobileVlThumb;
  String? vlTitle;
  String? updatedOn;

  MillinniumModal(
      {this.id,
      this.vlVideo,
      this.imagePath,
      this.image,
      this.mobileVlThumb,
      this.vlTitle,
      this.updatedOn});

  MillinniumModal.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.vlVideo = json["vl_video"];
    this.imagePath = json["image_path"];
    this.image = json["image"];
    this.mobileVlThumb = json["mobile_vl_thumb"];
    this.vlTitle = json["vl_title"];
    this.updatedOn = json["updated_on"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["vl_video"] = this.vlVideo;
    data["image_path"] = this.imagePath;
    data["image"] = this.image;
    data["mobile_vl_thumb"] = this.mobileVlThumb;
    data["vl_title"] = this.vlTitle;
    data["updated_on"] = this.updatedOn;
    return data;
  }
}
