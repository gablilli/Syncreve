// This is a generated file - do not edit.
//
// Generated from upload_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UploadTaskStatus extends $pb.ProtobufEnum {
  static const UploadTaskStatus UPLOAD_WAITING =
      UploadTaskStatus._(0, _omitEnumNames ? '' : 'UPLOAD_WAITING');
  static const UploadTaskStatus UPLOADING =
      UploadTaskStatus._(1, _omitEnumNames ? '' : 'UPLOADING');
  static const UploadTaskStatus UPLOAD_PAUSED =
      UploadTaskStatus._(2, _omitEnumNames ? '' : 'UPLOAD_PAUSED');
  static const UploadTaskStatus UPLOAD_COMPLETED =
      UploadTaskStatus._(3, _omitEnumNames ? '' : 'UPLOAD_COMPLETED');
  static const UploadTaskStatus UPLOAD_FAILED =
      UploadTaskStatus._(4, _omitEnumNames ? '' : 'UPLOAD_FAILED');
  static const UploadTaskStatus UPLOAD_CANCELLED =
      UploadTaskStatus._(5, _omitEnumNames ? '' : 'UPLOAD_CANCELLED');

  static const $core.List<UploadTaskStatus> values = <UploadTaskStatus>[
    UPLOAD_WAITING,
    UPLOADING,
    UPLOAD_PAUSED,
    UPLOAD_COMPLETED,
    UPLOAD_FAILED,
    UPLOAD_CANCELLED,
  ];

  static final $core.List<UploadTaskStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static UploadTaskStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UploadTaskStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
