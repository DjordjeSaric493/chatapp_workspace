/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'channel.dart' as _i3;
import 'package:chatapp_client/src/protocol/protocol.dart' as _i4;

abstract class Message implements _i1.SerializableModel {
  Message._({
    this.id,
    required this.content,
    required this.timestamp,
    required this.senderId,
    this.sender,
    required this.channelId,
    this.channel,
    this.status,
    bool? isMedia,
    this.mediaUrl,
  }) : isMedia = isMedia ?? false;

  factory Message({
    int? id,
    required String content,
    required DateTime timestamp,
    required int senderId,
    _i2.UserInfo? sender,
    required int channelId,
    _i3.Channel? channel,
    String? status,
    bool? isMedia,
    String? mediaUrl,
  }) = _MessageImpl;

  factory Message.fromJson(Map<String, dynamic> jsonSerialization) {
    return Message(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      senderId: jsonSerialization['senderId'] as int,
      sender: jsonSerialization['sender'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserInfo>(
              jsonSerialization['sender'],
            ),
      channelId: jsonSerialization['channelId'] as int,
      channel: jsonSerialization['channel'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Channel>(
              jsonSerialization['channel'],
            ),
      status: jsonSerialization['status'] as String?,
      isMedia: jsonSerialization['isMedia'] as bool,
      mediaUrl: jsonSerialization['mediaUrl'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String content;

  DateTime timestamp;

  int senderId;

  _i2.UserInfo? sender;

  int channelId;

  _i3.Channel? channel;

  String? status;

  bool isMedia;

  String? mediaUrl;

  /// Returns a shallow copy of this [Message]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Message copyWith({
    int? id,
    String? content,
    DateTime? timestamp,
    int? senderId,
    _i2.UserInfo? sender,
    int? channelId,
    _i3.Channel? channel,
    String? status,
    bool? isMedia,
    String? mediaUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Message',
      if (id != null) 'id': id,
      'content': content,
      'timestamp': timestamp.toJson(),
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJson(),
      'channelId': channelId,
      if (channel != null) 'channel': channel?.toJson(),
      if (status != null) 'status': status,
      'isMedia': isMedia,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MessageImpl extends Message {
  _MessageImpl({
    int? id,
    required String content,
    required DateTime timestamp,
    required int senderId,
    _i2.UserInfo? sender,
    required int channelId,
    _i3.Channel? channel,
    String? status,
    bool? isMedia,
    String? mediaUrl,
  }) : super._(
         id: id,
         content: content,
         timestamp: timestamp,
         senderId: senderId,
         sender: sender,
         channelId: channelId,
         channel: channel,
         status: status,
         isMedia: isMedia,
         mediaUrl: mediaUrl,
       );

  /// Returns a shallow copy of this [Message]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Message copyWith({
    Object? id = _Undefined,
    String? content,
    DateTime? timestamp,
    int? senderId,
    Object? sender = _Undefined,
    int? channelId,
    Object? channel = _Undefined,
    Object? status = _Undefined,
    bool? isMedia,
    Object? mediaUrl = _Undefined,
  }) {
    return Message(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      senderId: senderId ?? this.senderId,
      sender: sender is _i2.UserInfo? ? sender : this.sender?.copyWith(),
      channelId: channelId ?? this.channelId,
      channel: channel is _i3.Channel? ? channel : this.channel?.copyWith(),
      status: status is String? ? status : this.status,
      isMedia: isMedia ?? this.isMedia,
      mediaUrl: mediaUrl is String? ? mediaUrl : this.mediaUrl,
    );
  }
}
