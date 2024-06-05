import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.g.dart';

class BaseResponse {
  @JsonKey(name: 'resultCode')
  final int? resultCode;
  @JsonKey(name: 'failures')
  final List<String>? failures;

  BaseResponse({this.resultCode, this.failures});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      resultCode: json["resultCode"],
      failures: json["failures"] != null ? (json["failures"] as List<String>).map((e) => e).toList() : null,
    );
  }
}

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponse<T> extends BaseResponse {
  List<T>? data;

  BaseListResponse({
    List<String>? failures,
    int? resultCode,
    this.data,
  }) : super(failures: failures, resultCode: resultCode);

  factory BaseListResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var data = <T>[];
    if(json['data'] != null){
      json['data'].forEach((v) {
        data.add(create(v));
      });
    }
    List<String>? failures;
    if(json["failures"] != null){
      failures = (json["failures"] as List).map((e) => e.toString()).toList();
    }else if(json["Failures"] != null){
      failures = (json["Failures"] as List).map((e) => e.toString()).toList();
    }else{
      failures = [];
    }

    return BaseListResponse<T>(
        resultCode: json["resultCode"],
        failures: failures,
        data: data);
  }
}

@JsonSerializable(genericArgumentFactories: true)
class BaseSingleResponse<T> extends BaseResponse {
  T? data;

  BaseSingleResponse({
    List<String>? failures,
    int? resultCode,
    this.data,
  }) : super(failures: failures, resultCode: resultCode);

  factory BaseSingleResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    List<String>? failures;
    if(json["failures"] != null){
      failures = (json["failures"] as List).map((e) => e.toString()).toList();
    }else if(json["Failures"] != null){
      failures = (json["Failures"] as List).map((e) => e.toString()).toList();
    }else{
      failures = [];
    }
    return BaseSingleResponse<T>(
        failures: failures,
        resultCode: json["resultCode"] ?? json["ResultCode"],
        data: json['data'] != null ? create(json['data']) : json['Data'] != null ? create(json['Data']) : null);
  }
}


