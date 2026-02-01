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

abstract class Message
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MessageTable();

  static const db = MessageRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Message',
      if (id != null) 'id': id,
      'content': content,
      'timestamp': timestamp.toJson(),
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJsonForProtocol(),
      'channelId': channelId,
      if (channel != null) 'channel': channel?.toJsonForProtocol(),
      if (status != null) 'status': status,
      'isMedia': isMedia,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
    };
  }

  static MessageInclude include({
    _i2.UserInfoInclude? sender,
    _i3.ChannelInclude? channel,
  }) {
    return MessageInclude._(
      sender: sender,
      channel: channel,
    );
  }

  static MessageIncludeList includeList({
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    MessageInclude? include,
  }) {
    return MessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Message.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Message.t),
      include: include,
    );
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

class MessageUpdateTable extends _i1.UpdateTable<MessageTable> {
  MessageUpdateTable(super.table);

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _i1.ColumnValue(
        table.timestamp,
        value,
      );

  _i1.ColumnValue<int, int> senderId(int value) => _i1.ColumnValue(
    table.senderId,
    value,
  );

  _i1.ColumnValue<int, int> channelId(int value) => _i1.ColumnValue(
    table.channelId,
    value,
  );

  _i1.ColumnValue<String, String> status(String? value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<bool, bool> isMedia(bool value) => _i1.ColumnValue(
    table.isMedia,
    value,
  );

  _i1.ColumnValue<String, String> mediaUrl(String? value) => _i1.ColumnValue(
    table.mediaUrl,
    value,
  );
}

class MessageTable extends _i1.Table<int?> {
  MessageTable({super.tableRelation}) : super(tableName: 'message') {
    updateTable = MessageUpdateTable(this);
    content = _i1.ColumnString(
      'content',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    senderId = _i1.ColumnInt(
      'senderId',
      this,
    );
    channelId = _i1.ColumnInt(
      'channelId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    isMedia = _i1.ColumnBool(
      'isMedia',
      this,
      hasDefault: true,
    );
    mediaUrl = _i1.ColumnString(
      'mediaUrl',
      this,
    );
  }

  late final MessageUpdateTable updateTable;

  late final _i1.ColumnString content;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnInt senderId;

  _i2.UserInfoTable? _sender;

  late final _i1.ColumnInt channelId;

  _i3.ChannelTable? _channel;

  late final _i1.ColumnString status;

  late final _i1.ColumnBool isMedia;

  late final _i1.ColumnString mediaUrl;

  _i2.UserInfoTable get sender {
    if (_sender != null) return _sender!;
    _sender = _i1.createRelationTable(
      relationFieldName: 'sender',
      field: Message.t.senderId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _sender!;
  }

  _i3.ChannelTable get channel {
    if (_channel != null) return _channel!;
    _channel = _i1.createRelationTable(
      relationFieldName: 'channel',
      field: Message.t.channelId,
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
    content,
    timestamp,
    senderId,
    channelId,
    status,
    isMedia,
    mediaUrl,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'sender') {
      return sender;
    }
    if (relationField == 'channel') {
      return channel;
    }
    return null;
  }
}

class MessageInclude extends _i1.IncludeObject {
  MessageInclude._({
    _i2.UserInfoInclude? sender,
    _i3.ChannelInclude? channel,
  }) {
    _sender = sender;
    _channel = channel;
  }

  _i2.UserInfoInclude? _sender;

  _i3.ChannelInclude? _channel;

  @override
  Map<String, _i1.Include?> get includes => {
    'sender': _sender,
    'channel': _channel,
  };

  @override
  _i1.Table<int?> get table => Message.t;
}

class MessageIncludeList extends _i1.IncludeList {
  MessageIncludeList._({
    _i1.WhereExpressionBuilder<MessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Message.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Message.t;
}

class MessageRepository {
  const MessageRepository._();

  final attachRow = const MessageAttachRowRepository._();

  /// Returns a list of [Message]s matching the given query parameters.
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
  Future<List<Message>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.find<Message>(
      where: where?.call(Message.t),
      orderBy: orderBy?.call(Message.t),
      orderByList: orderByList?.call(Message.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Message] matching the given query parameters.
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
  Future<Message?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.findFirstRow<Message>(
      where: where?.call(Message.t),
      orderBy: orderBy?.call(Message.t),
      orderByList: orderByList?.call(Message.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Message] by its [id] or null if no such row exists.
  Future<Message?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.findById<Message>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Message]s in the list and returns the inserted rows.
  ///
  /// The returned [Message]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Message>> insert(
    _i1.Session session,
    List<Message> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Message>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Message] and returns the inserted row.
  ///
  /// The returned [Message] will have its `id` field set.
  Future<Message> insertRow(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Message>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Message]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Message>> update(
    _i1.Session session,
    List<Message> rows, {
    _i1.ColumnSelections<MessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Message>(
      rows,
      columns: columns?.call(Message.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Message]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Message> updateRow(
    _i1.Session session,
    Message row, {
    _i1.ColumnSelections<MessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Message>(
      row,
      columns: columns?.call(Message.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Message] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Message?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MessageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Message>(
      id,
      columnValues: columnValues(Message.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Message]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Message>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MessageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MessageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Message>(
      columnValues: columnValues(Message.t.updateTable),
      where: where(Message.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Message.t),
      orderByList: orderByList?.call(Message.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Message]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Message>> delete(
    _i1.Session session,
    List<Message> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Message>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Message].
  Future<Message> deleteRow(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Message>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Message>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Message>(
      where: where(Message.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Message>(
      where: where?.call(Message.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MessageAttachRowRepository {
  const MessageAttachRowRepository._();

  /// Creates a relation between the given [Message] and [UserInfo]
  /// by setting the [Message]'s foreign key `senderId` to refer to the [UserInfo].
  Future<void> sender(
    _i1.Session session,
    Message message,
    _i2.UserInfo sender, {
    _i1.Transaction? transaction,
  }) async {
    if (message.id == null) {
      throw ArgumentError.notNull('message.id');
    }
    if (sender.id == null) {
      throw ArgumentError.notNull('sender.id');
    }

    var $message = message.copyWith(senderId: sender.id);
    await session.db.updateRow<Message>(
      $message,
      columns: [Message.t.senderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Message] and [Channel]
  /// by setting the [Message]'s foreign key `channelId` to refer to the [Channel].
  Future<void> channel(
    _i1.Session session,
    Message message,
    _i3.Channel channel, {
    _i1.Transaction? transaction,
  }) async {
    if (message.id == null) {
      throw ArgumentError.notNull('message.id');
    }
    if (channel.id == null) {
      throw ArgumentError.notNull('channel.id');
    }

    var $message = message.copyWith(channelId: channel.id);
    await session.db.updateRow<Message>(
      $message,
      columns: [Message.t.channelId],
      transaction: transaction,
    );
  }
}
