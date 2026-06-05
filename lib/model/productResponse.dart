import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'productResponse.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'response')
  final Response response;

  ProductResponse(this.response);

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class Response {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'altName')
  final String altName;
  @JsonKey(name: 'quantity')
  final String quantity;
  @JsonKey(name: 'pictures')
  final PicturesResponse pictures;

  Response(this.name, this.altName, this.quantity, this.pictures);

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class PicturesResponse {
  @JsonKey(name: 'product')
  final String product;
  @JsonKey(name: 'front')
  final String front;
  @JsonKey(name: 'nutrition')
  final String nutrition;

  PicturesResponse(this.product, this.front, this.nutrition);

  factory PicturesResponse.fromJson(Map<String, dynamic> json) =>
      _$PicturesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PicturesResponseToJson(this);
}

@RestApi()
abstract class ProductAPI {
  factory ProductAPI(Dio dio, {required String baseUrl}) = _ProductAPI;

  @GET('/getProduct?barcode={barcode}')
  Future<ProductResponse> load({
    @Path('barcode') String? barcode,
    CancelToken? token,
  });
}
