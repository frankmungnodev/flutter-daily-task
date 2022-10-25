// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Statistic extends DataClass implements Insertable<Statistic> {
  final int id;
  final int? todoId;
  final int progress;
  final Status status;
  final DateTime createdAt;
  const Statistic(
      {required this.id,
      this.todoId,
      required this.progress,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || todoId != null) {
      map['todo_id'] = Variable<int>(todoId);
    }
    map['progress'] = Variable<int>(progress);
    {
      final converter = Statistics.$converter0;
      map['status'] = Variable<int>(converter.toSql(status));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StatisticsCompanion toCompanion(bool nullToAbsent) {
    return StatisticsCompanion(
      id: Value(id),
      todoId:
          todoId == null && nullToAbsent ? const Value.absent() : Value(todoId),
      progress: Value(progress),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory Statistic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Statistic(
      id: serializer.fromJson<int>(json['id']),
      todoId: serializer.fromJson<int?>(json['todo_id']),
      progress: serializer.fromJson<int>(json['progress']),
      status: serializer.fromJson<Status>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'todo_id': serializer.toJson<int?>(todoId),
      'progress': serializer.toJson<int>(progress),
      'status': serializer.toJson<Status>(status),
      'created_at': serializer.toJson<DateTime>(createdAt),
    };
  }

  Statistic copyWith(
          {int? id,
          Value<int?> todoId = const Value.absent(),
          int? progress,
          Status? status,
          DateTime? createdAt}) =>
      Statistic(
        id: id ?? this.id,
        todoId: todoId.present ? todoId.value : this.todoId,
        progress: progress ?? this.progress,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Statistic(')
          ..write('id: $id, ')
          ..write('todoId: $todoId, ')
          ..write('progress: $progress, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, todoId, progress, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Statistic &&
          other.id == this.id &&
          other.todoId == this.todoId &&
          other.progress == this.progress &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class StatisticsCompanion extends UpdateCompanion<Statistic> {
  final Value<int> id;
  final Value<int?> todoId;
  final Value<int> progress;
  final Value<Status> status;
  final Value<DateTime> createdAt;
  const StatisticsCompanion({
    this.id = const Value.absent(),
    this.todoId = const Value.absent(),
    this.progress = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  StatisticsCompanion.insert({
    this.id = const Value.absent(),
    this.todoId = const Value.absent(),
    this.progress = const Value.absent(),
    required Status status,
    required DateTime createdAt,
  })  : status = Value(status),
        createdAt = Value(createdAt);
  static Insertable<Statistic> custom({
    Expression<int>? id,
    Expression<int>? todoId,
    Expression<int>? progress,
    Expression<int>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (todoId != null) 'todo_id': todoId,
      if (progress != null) 'progress': progress,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  StatisticsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? todoId,
      Value<int>? progress,
      Value<Status>? status,
      Value<DateTime>? createdAt}) {
    return StatisticsCompanion(
      id: id ?? this.id,
      todoId: todoId ?? this.todoId,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (todoId.present) {
      map['todo_id'] = Variable<int>(todoId.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (status.present) {
      final converter = Statistics.$converter0;
      map['status'] = Variable<int>(converter.toSql(status.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatisticsCompanion(')
          ..write('id: $id, ')
          ..write('todoId: $todoId, ')
          ..write('progress: $progress, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class Statistics extends Table with TableInfo<Statistics, Statistic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Statistics(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _todoIdMeta = const VerificationMeta('todoId');
  late final GeneratedColumn<int> todoId = GeneratedColumn<int>(
      'todo_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES todos(id)');
  final VerificationMeta _progressMeta = const VerificationMeta('progress');
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
      'progress', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression<int>('0'));
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumnWithTypeConverter<Status, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<Status>(Statistics.$converter0);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, todoId, progress, status, createdAt];
  @override
  String get aliasedName => _alias ?? 'statistics';
  @override
  String get actualTableName => 'statistics';
  @override
  VerificationContext validateIntegrity(Insertable<Statistic> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('todo_id')) {
      context.handle(_todoIdMeta,
          todoId.isAcceptableOrUnknown(data['todo_id']!, _todoIdMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Statistic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Statistic(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      todoId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}todo_id']),
      progress: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}progress'])!,
      status: Statistics.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  Statistics createAlias(String alias) {
    return Statistics(attachedDatabase, alias);
  }

  static TypeConverter<Status, int> $converter0 =
      const EnumIndexConverter<Status>(Status.values);
  @override
  bool get dontWriteConstraints => true;
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final String? body;
  final int minutes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Todo(
      {required this.id,
      required this.title,
      this.body,
      required this.minutes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    map['minutes'] = Variable<int>(minutes);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      minutes: Value(minutes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String?>(json['body']),
      minutes: serializer.fromJson<int>(json['minutes']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String?>(body),
      'minutes': serializer.toJson<int>(minutes),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Todo copyWith(
          {int? id,
          String? title,
          Value<String?> body = const Value.absent(),
          int? minutes,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body.present ? body.value : this.body,
        minutes: minutes ?? this.minutes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('minutes: $minutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, body, minutes, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.minutes == this.minutes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> body;
  final Value<int> minutes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.minutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.body = const Value.absent(),
    required int minutes,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : title = Value(title),
        minutes = Value(minutes),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<int>? minutes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (minutes != null) 'minutes': minutes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? body,
      Value<int>? minutes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      minutes: minutes ?? this.minutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (minutes.present) {
      map['minutes'] = Variable<int>(minutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('minutes: $minutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class Todos extends Table with TableInfo<Todos, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Todos(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _minutesMeta = const VerificationMeta('minutes');
  late final GeneratedColumn<int> minutes = GeneratedColumn<int>(
      'minutes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, body, minutes, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    }
    if (data.containsKey('minutes')) {
      context.handle(_minutesMeta,
          minutes.isAcceptableOrUnknown(data['minutes']!, _minutesMeta));
    } else if (isInserting) {
      context.missing(_minutesMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}body']),
      minutes: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}minutes'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  Todos createAlias(String alias) {
    return Todos(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$MDatabase extends GeneratedDatabase {
  _$MDatabase(QueryExecutor e) : super(e);
  late final Statistics statistics = Statistics(this);
  late final Todos todos = Todos(this);
  Future<int> insertStatic(int? var1, int var2, Status var3, DateTime var4) {
    return customInsert(
      'INSERT INTO statistics (todo_id, progress, status, created_at) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<int>(var1),
        Variable<int>(var2),
        Variable<int>(Statistics.$converter0.toSql(var3)),
        Variable<DateTime>(var4)
      ],
      updates: {statistics},
    );
  }

  Future<int> insertTodo(
      String var1, String? var2, int var3, DateTime var4, DateTime var5) {
    return customInsert(
      'INSERT INTO todos (title, body, minutes, created_at, updated_at) VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<String>(var1),
        Variable<String>(var2),
        Variable<int>(var3),
        Variable<DateTime>(var4),
        Variable<DateTime>(var5)
      ],
      updates: {todos},
    );
  }

  Selectable<Todo> getAllTodos() {
    return customSelect('SELECT * FROM todos ORDER BY created_at DESC',
        variables: [],
        readsFrom: {
          todos,
        }).asyncMap(todos.mapFromRow);
  }

  Selectable<Todo> getTodoById(int var1) {
    return customSelect('SELECT * FROM todos WHERE id = ?1', variables: [
      Variable<int>(var1)
    ], readsFrom: {
      todos,
    }).asyncMap(todos.mapFromRow);
  }

  Future<int> updateTodoById(
      String var1, String? var2, int var3, DateTime var4, int var5) {
    return customUpdate(
      'UPDATE todos SET title = ?1, body = ?2, minutes = ?3, updated_at = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(var1),
        Variable<String>(var2),
        Variable<int>(var3),
        Variable<DateTime>(var4),
        Variable<int>(var5)
      ],
      updates: {todos},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteTodoById(int var1) {
    return customUpdate(
      'DELETE FROM todos WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {todos},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [statistics, todos];
}
