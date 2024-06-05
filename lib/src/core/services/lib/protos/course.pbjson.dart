//
//  Generated code. Do not modify.
//  source: lib/protos/course.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getCoursesRequestDescriptor instead')
const GetCoursesRequest$json = {
  '1': 'GetCoursesRequest',
};

/// Descriptor for `GetCoursesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCoursesRequestDescriptor = $convert.base64Decode(
    'ChFHZXRDb3Vyc2VzUmVxdWVzdA==');

@$core.Deprecated('Use getCoursesResponseDescriptor instead')
const GetCoursesResponse$json = {
  '1': 'GetCoursesResponse',
  '2': [
    {'1': 'courses', '3': 1, '4': 3, '5': 11, '6': '.Course', '10': 'courses'},
  ],
};

/// Descriptor for `GetCoursesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCoursesResponseDescriptor = $convert.base64Decode(
    'ChJHZXRDb3Vyc2VzUmVzcG9uc2USIQoHY291cnNlcxgBIAMoCzIHLkNvdXJzZVIHY291cnNlcw'
    '==');

@$core.Deprecated('Use courseDescriptor instead')
const Course$json = {
  '1': 'Course',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'subtitle', '3': 4, '4': 1, '5': 9, '10': 'subtitle'},
    {'1': 'lessons', '3': 5, '4': 3, '5': 11, '6': '.Lesson', '10': 'lessons'},
    {'1': 'image', '3': 6, '4': 1, '5': 9, '10': 'image'},
  ],
};

/// Descriptor for `Course`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List courseDescriptor = $convert.base64Decode(
    'CgZDb3Vyc2USDgoCaWQYASABKAVSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIgCgtkZXNjcm'
    'lwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SGgoIc3VidGl0bGUYBCABKAlSCHN1YnRpdGxlEiEK'
    'B2xlc3NvbnMYBSADKAsyBy5MZXNzb25SB2xlc3NvbnMSFAoFaW1hZ2UYBiABKAlSBWltYWdl');

@$core.Deprecated('Use lessonDescriptor instead')
const Lesson$json = {
  '1': 'Lesson',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'questions', '3': 5, '4': 3, '5': 11, '6': '.Question', '10': 'questions'},
    {'1': 'image', '3': 6, '4': 1, '5': 9, '10': 'image'},
  ],
};

/// Descriptor for `Lesson`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lessonDescriptor = $convert.base64Decode(
    'CgZMZXNzb24SDgoCaWQYASABKAVSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIgCgtkZXNjcm'
    'lwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SGAoHY29udGVudBgEIAEoCVIHY29udGVudBInCglx'
    'dWVzdGlvbnMYBSADKAsyCS5RdWVzdGlvblIJcXVlc3Rpb25zEhQKBWltYWdlGAYgASgJUgVpbW'
    'FnZQ==');

@$core.Deprecated('Use questionDescriptor instead')
const Question$json = {
  '1': 'Question',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'options', '3': 3, '4': 3, '5': 9, '10': 'options'},
    {'1': 'correct_option', '3': 4, '4': 1, '5': 9, '10': 'correctOption'},
  ],
};

/// Descriptor for `Question`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List questionDescriptor = $convert.base64Decode(
    'CghRdWVzdGlvbhIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEhgKB29wdG'
    'lvbnMYAyADKAlSB29wdGlvbnMSJQoOY29ycmVjdF9vcHRpb24YBCABKAlSDWNvcnJlY3RPcHRp'
    'b24=');

