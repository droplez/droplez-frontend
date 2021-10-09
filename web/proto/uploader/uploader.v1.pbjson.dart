///
//  Generated code. Do not modify.
//  source: uploader/uploader.v1.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use chunkDescriptor instead')
const Chunk$json = const {
  '1': 'Chunk',
  '2': const [
    const {'1': 'Content', '3': 1, '4': 1, '5': 12, '10': 'Content'},
    const {'1': 'metadata', '3': 2, '4': 1, '5': 11, '6': '.droplez_uploader.FileMetadata', '10': 'metadata'},
  ],
};

/// Descriptor for `Chunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkDescriptor = $convert.base64Decode('CgVDaHVuaxIYCgdDb250ZW50GAEgASgMUgdDb250ZW50EjoKCG1ldGFkYXRhGAIgASgLMh4uZHJvcGxlel91cGxvYWRlci5GaWxlTWV0YWRhdGFSCG1ldGFkYXRh');
@$core.Deprecated('Use fileMetadataDescriptor instead')
const FileMetadata$json = const {
  '1': 'FileMetadata',
  '2': const [
    const {'1': 'Author', '3': 1, '4': 1, '5': 9, '10': 'Author'},
    const {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Description', '3': 3, '4': 1, '5': 9, '10': 'Description'},
  ],
};

/// Descriptor for `FileMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileMetadataDescriptor = $convert.base64Decode('CgxGaWxlTWV0YWRhdGESFgoGQXV0aG9yGAEgASgJUgZBdXRob3ISEgoETmFtZRgCIAEoCVIETmFtZRIgCgtEZXNjcmlwdGlvbhgDIAEoCVILRGVzY3JpcHRpb24=');
@$core.Deprecated('Use uploadedFileDataDescriptor instead')
const UploadedFileData$json = const {
  '1': 'UploadedFileData',
  '2': const [
    const {'1': 'UUID', '3': 1, '4': 1, '5': 9, '10': 'UUID'},
  ],
};

/// Descriptor for `UploadedFileData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadedFileDataDescriptor = $convert.base64Decode('ChBVcGxvYWRlZEZpbGVEYXRhEhIKBFVVSUQYASABKAlSBFVVSUQ=');
