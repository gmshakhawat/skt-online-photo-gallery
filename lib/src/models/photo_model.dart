// To parse this JSON data, dodynamic 
//
//     final PhotoModel = PhotoModelFromJson(jsonString);

import 'dart:convert';

List<PhotoModel> photoModelFromJson(dynamic str) =>
    List<PhotoModel>.from(
        json.decode(str).map((x) => PhotoModel.fromJson(x)));


class PhotoModel {
  PhotoModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
  });

  dynamic id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? width;
  int? height;
  dynamic color;
  dynamic blurHash;
  dynamic description;
  dynamic altDescription;
  Urls? urls;
  Links? links;
  int? likes;
  bool ?likedByUser;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        color: json["color"] == null ? null : json["color"],
        blurHash: json["blur_hash"] == null ? null : json["blur_hash"],
        description: json["description"],
        altDescription:
            json["alt_description"] == null ? null : json["alt_description"],
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        likes: json["likes"] == null ? null : json["likes"],
        likedByUser:
            json["liked_by_user"] == null ? null : json["liked_by_user"],
      );


}

class Links {
  Links({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  dynamic self;
  dynamic html;
  dynamic download;
  dynamic downloadLocation;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : json["self"],
        html: json["html"] == null ? null : json["html"],
        download: json["download"] == null ? null : json["download"],
        downloadLocation: json["download_location"] == null
            ? null
            : json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self == null ? null : self,
        "html": html == null ? null : html,
        "download": download == null ? null : download,
        "download_location": downloadLocation == null ? null : downloadLocation,
      };
}

class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  dynamic raw;
  dynamic full;
  dynamic regular;
  dynamic small;
  dynamic thumb;
  dynamic smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"] == null ? null : json["raw"],
        full: json["full"] == null ? null : json["full"],
        regular: json["regular"] == null ? null : json["regular"],
        small: json["small"] == null ? null : json["small"],
        thumb: json["thumb"] == null ? null : json["thumb"],
        smallS3: json["small_s3"] == null ? null : json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw == null ? null : raw,
        "full": full == null ? null : full,
        "regular": regular == null ? null : regular,
        "small": small == null ? null : small,
        "thumb": thumb == null ? null : thumb,
        "small_s3": smallS3 == null ? null : smallS3,
      };
}
