/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'channel.dart' as _i3;
import 'package:chatapp_server/src/generated/protocol.dart' as _i4;

abstract class ChannelMember
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ChannelMemberTable();

  static const db = ChannelMemberRepository._();

  @override
  int? id;

  int userId;

  _i2.UserInfo? user;

  int channelId;

  _i3.Channel? channel;

  String role;

  DateTime? joinedAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ChannelMember',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'channelId': channelId,
      if (channel != null) 'channel': channel?.toJsonForProtocol(),
      'role': role,
      if (joinedAt != null) 'joinedAt': joinedAt?.toJson(),
    };
  }

  static ChannelMemberInclude include({
    _i2.UserInfoInclude? user,
    _i3.ChannelInclude? channel,
  }) {
    return ChannelMemberInclude._(
      user: user,
      channel: channel,
    );
  }

  static ChannelMemberIncludeList includeList({
    _i1.WhereExpressionBuilder<ChannelMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChannelMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChannelMemberTable>? orderByList,
    ChannelMemberInclude? include,
  }) {
    return ChannelMemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChannelMember.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ChannelMember.t),
      include: include,
    );
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

class ChannelMemberUpdateTable extends _i1.UpdateTable<ChannelMemberTable> {
  ChannelMemberUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<int, int> channelId(int value) => _i1.ColumnValue(
    table.channelId,
    value,
  );

  _i1.ColumnValue<String, String> role(String value) => _i1.ColumnValue(
    table.role,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> joinedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.joinedAt,
        value,
      );
}

class ChannelMemberTable extends _i1.Table<int?> {
  ChannelMemberTable({super.tableRelation})
    : super(tableName: 'channel_member') {
    updateTable = ChannelMemberUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    channelId = _i1.ColumnInt(
      'channelId',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    joinedAt = _i1.ColumnDateTime(
      'joinedAt',
      this,
    );
  }

  late final ChannelMemberUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  _i2.UserInfoTable? _user;

  late final _i1.ColumnInt channelId;

  _i3.ChannelTable? _channel;

  late final _i1.ColumnString role;

  late final _i1.ColumnDateTime joinedAt;

  _i2.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: ChannelMember.t.userId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.ChannelTable get channel {
    if (_channel != null) return _channel!;
    _channel = _i1.createRelationTable(
      relationFieldName: 'channel',
      field: ChannelMember.t.channelId,
      foreignField: _i3.Channel.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ChannelTable(tableRelation: foreignTableRelation),
    );
    return _channel!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    channelId,
    role,
    joinedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'channel') {
      return channel;
    }
    return null;
  }
}

class ChannelMemberInclude extends _i1.IncludeObject {
  ChannelMemberInclude._({
    _i2.UserInfoInclude? user,
    _i3.ChannelInclude? channel,
  }) {
    _user = user;
    _channel = channel;
  }

  _i2.UserInfoInclude? _user;

  _i3.ChannelInclude? _channel;

  @override
  Map<String, _i1.Include?> get includes => {
    'user': _user,
    'channel': _channel,
  };

  @override
  _i1.Table<int?> get table => ChannelMember.t;
}

class ChannelMemberIncludeList extends _i1.IncludeList {
  ChannelMemberIncludeList._({
    _i1.WhereExpressionBuilder<ChannelMemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ChannelMember.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ChannelMember.t;
}

class ChannelMemberRepository {
  const ChannelMemberRepository._();

  final attachRow = const ChannelMemberAttachRowRepository._();

  /// Returns a list of [ChannelMember]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<ChannelMember>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChannelMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChannelMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChannelMemberTable>? orderByList,
    _i1.Transaction? transaction,
    ChannelMemberInclude? include,
  }) async {
    return session.db.find<ChannelMember>(
      where: where?.call(ChannelMember.t),
      orderBy: orderBy?.call(ChannelMember.t),
      orderByList: orderByList?.call(ChannelMember.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ChannelMember] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<ChannelMember?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChannelMemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChannelMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChannelMemberTable>? orderByList,
    _i1.Transaction? transaction,
    ChannelMemberInclude? include,
  }) async {
    return session.db.findFirstRow<ChannelMember>(
      where: where?.call(ChannelMember.t),
      orderBy: orderBy?.call(ChannelMember.t),
      orderByList: orderByList?.call(ChannelMember.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ChannelMember] by its [id] or null if no such row exists.
  Future<ChannelMember?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ChannelMemberInclude? include,
  }) async {
    return session.db.findById<ChannelMember>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ChannelMember]s in the list and returns the inserted rows.
  ///
  /// The returned [ChannelMember]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ChannelMember>> insert(
    _i1.Session session,
    List<ChannelMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ChannelMember>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ChannelMember] and returns the inserted row.
  ///
  /// The returned [ChannelMember] will have its `id` field set.
  Future<ChannelMember> insertRow(
    _i1.Session session,
    ChannelMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ChannelMember>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ChannelMember]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ChannelMember>> update(
    _i1.Session session,
    List<ChannelMember> rows, {
    _i1.ColumnSelections<ChannelMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ChannelMember>(
      rows,
      columns: columns?.call(ChannelMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ChannelMember]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ChannelMember> updateRow(
    _i1.Session session,
    ChannelMember row, {
    _i1.ColumnSelections<ChannelMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ChannelMember>(
      row,
      columns: columns?.call(ChannelMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ChannelMember] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ChannelMember?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ChannelMemberUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ChannelMember>(
      id,
      columnValues: columnValues(ChannelMember.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ChannelMember]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ChannelMember>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ChannelMemberUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ChannelMemberTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChannelMemberTable>? orderBy,
    _i1.OrderByListBuilder<ChannelMemberTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ChannelMember>(
      columnValues: columnValues(ChannelMember.t.updateTable),
      where: where(ChannelMember.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChannelMember.t),
      orderByList: orderByList?.call(ChannelMember.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ChannelMember]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ChannelMember>> delete(
    _i1.Session session,
    List<ChannelMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ChannelMember>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ChannelMember].
  Future<ChannelMember> deleteRow(
    _i1.Session session,
    ChannelMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ChannelMember>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ChannelMember>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ChannelMemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ChannelMember>(
      where: where(ChannelMember.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChannelMemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ChannelMember>(
      where: where?.call(ChannelMember.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ChannelMemberAttachRowRepository {
  const ChannelMemberAttachRowRepository._();

  /// Creates a relation between the given [ChannelMember] and [UserInfo]
  /// by setting the [ChannelMember]'s foreign key `userId` to refer to the [UserInfo].
  Future<void> user(
    _i1.Session session,
    ChannelMember channelMember,
    _i2.UserInfo user, {
    _i1.Transaction? transaction,
  }) async {
    if (channelMember.id == null) {
      throw ArgumentError.notNull('channelMember.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $channelMember = channelMember.copyWith(userId: user.id);
    await session.db.updateRow<ChannelMember>(
      $channelMember,
      columns: [ChannelMember.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ChannelMember] and [Channel]
  /// by setting the [ChannelMember]'s foreign key `channelId` to refer to the [Channel].
  Future<void> channel(
    _i1.Session session,
    ChannelMember channelMember,
    _i3.Channel channel, {
    _i1.Transaction? transaction,
  }) async {
    if (channelMember.id == null) {
      throw ArgumentError.notNull('channelMember.id');
    }
    if (channel.id == null) {
      throw ArgumentError.notNull('channel.id');
    }

    var $channelMember = channelMember.copyWith(channelId: channel.id);
    await session.db.updateRow<ChannelMember>(
      $channelMember,
      columns: [ChannelMember.t.channelId],
      transaction: transaction,
    );
  }
}
