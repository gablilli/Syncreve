// This is a generated file - do not edit.
//
// Generated from download_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TaskStatus extends $pb.ProtobufEnum {
  static const TaskStatus WAITING =
      TaskStatus._(0, _omitEnumNames ? '' : 'WAITING');
  static const TaskStatus DOWNLOADING =
      TaskStatus._(1, _omitEnumNames ? '' : 'DOWNLOADING');
  static const TaskStatus PAUSED =
      TaskStatus._(2, _omitEnumNames ? '' : 'PAUSED');
  static const TaskStatus COMPLETED =
      TaskStatus._(3, _omitEnumNames ? '' : 'COMPLETED');
  static const TaskStatus FAILED =
      TaskStatus._(4, _omitEnumNames ? '' : 'FAILED');
  static const TaskStatus CANCELLED =
      TaskStatus._(5, _omitEnumNames ? '' : 'CANCELLED');

  static const $core.List<TaskStatus> values = <TaskStatus>[
    WAITING,
    DOWNLOADING,
    PAUSED,
    COMPLETED,
    FAILED,
    CANCELLED,
  ];

  static final $core.List<TaskStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static TaskStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TaskStatus._(super.value, super.name);
}

class TaskType extends $pb.ProtobufEnum {
  static const TaskType NORMAL = TaskType._(0, _omitEnumNames ? '' : 'NORMAL');
  static const TaskType BATCH = TaskType._(1, _omitEnumNames ? '' : 'BATCH');
  static const TaskType SYNC = TaskType._(2, _omitEnumNames ? '' : 'SYNC');

  static const $core.List<TaskType> values = <TaskType>[
    NORMAL,
    BATCH,
    SYNC,
  ];

  static final $core.List<TaskType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static TaskType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TaskType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
