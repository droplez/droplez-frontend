///
//  Generated code. Do not modify.
//  source: uploader/uploader.v1.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'uploader.v1.pb.dart' as $0;
export 'uploader.v1.pb.dart';

class UploaderClient extends $grpc.Client {
  static final _$upload = $grpc.ClientMethod<$0.Chunk, $0.UploadedFileData>(
      '/droplez_uploader.Uploader/Upload',
      ($0.Chunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadedFileData.fromBuffer(value));

  UploaderClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UploadedFileData> upload(
      $async.Stream<$0.Chunk> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$upload, request, options: options).single;
  }
}

abstract class UploaderServiceBase extends $grpc.Service {
  $core.String get $name => 'droplez_uploader.Uploader';

  UploaderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Chunk, $0.UploadedFileData>(
        'Upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $0.Chunk.fromBuffer(value),
        ($0.UploadedFileData value) => value.writeToBuffer()));
  }

  $async.Future<$0.UploadedFileData> upload(
      $grpc.ServiceCall call, $async.Stream<$0.Chunk> request);
}
