class Tranding {
  String? msg;
  String? vlThumbBasePath;
  bool? status;
  Data? data;
  bool? error;

  Tranding(
      {this.msg, this.vlThumbBasePath, this.status, this.data, this.error});

  Tranding.fromJson(Map<String, dynamic> json) {
    this.msg = json["msg"];
    this.vlThumbBasePath = json["vl_thumb_base_path"];
    this.status = json["status"];
    this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
    this.error = json["error"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["msg"] = this.msg;
    data["vl_thumb_base_path"] = this.vlThumbBasePath;
    data["status"] = this.status;
    if (this.data != null) data["data"] = this.data?.toJson();
    data["error"] = this.error;
    return data;
  }
}

class Data {
  List<VideoLibraries>? videoLibraries;

  Data({this.videoLibraries});

  Data.fromJson(Map<String, dynamic> json) {
    this.videoLibraries = json["video_libraries"] == null
        ? null
        : (json["video_libraries"] as List)
            .map((e) => VideoLibraries.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.videoLibraries != null)
      data["video_libraries"] =
          this.videoLibraries?.map((e) => e.toJson()).toList();
    return data;
  }
}

class VideoLibraries {
  String? id;
  String? vlTitle;
  String? vlThumb;
  String? mobileVlThumb;
  String? vlVideo;
  String? vlCategory;
  String? showOnHomeP;
  String? showOnAgentP;
  String? createdOn;
  String? updatedOn;
  String? status;
  String? searchTags;

  VideoLibraries(
      {this.id,
      this.vlTitle,
      this.vlThumb,
      this.mobileVlThumb,
      this.vlVideo,
      this.vlCategory,
      this.showOnHomeP,
      this.showOnAgentP,
      this.createdOn,
      this.updatedOn,
      this.status,
      this.searchTags});

  VideoLibraries.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.vlTitle = json["vl_title"];
    this.vlThumb = json["vl_thumb"];
    this.mobileVlThumb = json["mobile_vl_thumb"];
    this.vlVideo = json["vl_video"];
    this.vlCategory = json["vl_category"];
    this.showOnHomeP = json["show_on_homeP"];
    this.showOnAgentP = json["show_on_agentP"];
    this.createdOn = json["created_on"];
    this.updatedOn = json["updated_on"];
    this.status = json["status"];
    this.searchTags = json["search_tags"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["vl_title"] = this.vlTitle;
    data["vl_thumb"] = this.vlThumb;
    data["mobile_vl_thumb"] = this.mobileVlThumb;
    data["vl_video"] = this.vlVideo;
    data["vl_category"] = this.vlCategory;
    data["show_on_homeP"] = this.showOnHomeP;
    data["show_on_agentP"] = this.showOnAgentP;
    data["created_on"] = this.createdOn;
    data["updated_on"] = this.updatedOn;
    data["status"] = this.status;
    data["search_tags"] = this.searchTags;
    return data;
  }
}
