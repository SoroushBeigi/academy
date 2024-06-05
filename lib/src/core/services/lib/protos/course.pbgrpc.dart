//
//  Generated code. Do not modify.
//  source: lib/protos/course.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'course.pb.dart' as $0;

export 'course.pb.dart';

@$pb.GrpcServiceName('GetCoursesService')
class GetCoursesServiceClient extends $grpc.Client {
  static final _$getCourses = $grpc.ClientMethod<$0.GetCoursesRequest, $0.GetCoursesResponse>(
      '/GetCoursesService/GetCourses',
      ($0.GetCoursesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetCoursesResponse.fromBuffer(value));

  GetCoursesServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetCoursesResponse> getCourses($0.GetCoursesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCourses, request, options: options);
  }
}

@$pb.GrpcServiceName('GetCoursesService')
abstract class GetCoursesServiceBase extends $grpc.Service {
  $core.String get $name => 'GetCoursesService';

  GetCoursesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetCoursesRequest, $0.GetCoursesResponse>(
        'GetCourses',
        getCourses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCoursesRequest.fromBuffer(value),
        ($0.GetCoursesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetCoursesResponse> getCourses_Pre($grpc.ServiceCall call, $async.Future<$0.GetCoursesRequest> request) async {
    return getCourses(call, await request);
  }

  $async.Future<$0.GetCoursesResponse> getCourses($grpc.ServiceCall call, $0.GetCoursesRequest request);
}
