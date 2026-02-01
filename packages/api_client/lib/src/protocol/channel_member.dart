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

abstract class ChannelMember implements _i1.SerializableModel {
  ChannelMember._({
    this.id,
    required this.userId,
    this.user,
    required this.channelId,
    this.channel,
    required this.role,
    this.joinedAt,
  });

  factory ChannelMember({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required int channelId,
    _i3.Channel? channel,
    required String role,
    DateTime? joinedAt,
  }) = _ChannelMemberImpl;

  factory ChannelMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChannelMember(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserInfo>(jsonSerialization['user']),
      channelId: jsonSerialization['channelId'] as int,
      channel: jsonSerialization['channel'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Channel>(
              jsonSerialization['channel'],
            ),
      role: jsonSerialization['role'] as String,
      joinedAt: jsonSerialization['joinedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['joinedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserInfo? user;

  int channelId;

  _i3.Channel? channel;

  String role;

  DateTime? joinedAt;

  /// Returns a shallow copy of this [ChannelMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChannelMember copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    int? channelId,
    _i3.Channel? channel,
    String? role,
    DateTime? joinedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChannelMember',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'channelId': channelId,
      if (channel != null) 'channel': channel?.toJson(),
      'role': role,
      if (joinedAt != null) 'joinedAt': joinedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChannelMemberImpl extends ChannelMember {
  _ChannelMemberImpl({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required int channelId,
    _i3.Channel? channel,
    required String role,
    DateTime? joinedAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         channelId: channelId,
         channel: channel,
         role: role,
         joinedAt: joinedAt,
       );

  /// Returns a shallow copy of this [ChannelMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChannelMember copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? channelId,
    Object? channel = _Undefined,
    String? role,
    Object? joinedAt = _Undefined,
  }) {
    return ChannelMember(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      channelId: channelId ?? this.channelId,
      channel: channel is _i3.Channel? ? channel : this.channel?.copyWith(),
      role: role ?? this.role,
      joinedAt: joinedAt is DateTime? ? joinedAt : this.joinedAt,
    );
  }
}
