// To parse this JSON data, do
//
//final requestFailed = requestFailedFromJson(jsonString);

import 'dart:convert';

RequestFailed requestFailedFromJson(String str) => RequestFailed.fromJson(json.decode(str));

String requestFailedToJson(RequestFailed data) => json.encode(data.toJson());

class RequestFailed {
  RequestFailed({
    required this.detail,
  });

  final String detail;

  factory RequestFailed.fromJson(Map<String, dynamic> json) => RequestFailed(
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
      };
}
