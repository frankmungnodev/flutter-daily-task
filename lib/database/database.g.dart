// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final String? body;
  final int duration;
  final int priority;
  final String createdAt;
  final String updatedAt;
  const Todo(
      {required this.id,
      required this.title,
      this.body,
      required this.duration,
      required this.priority,
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
    map['duration'] = Variable<int>(duration);
    map['priority'] = Variable<int>(priority);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      duration: Value(duration),
      priority: Value(priority),
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
      duration: serializer.fromJson<int>(json['duration']),
      priority: serializer.fromJson<int>(json['priority']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String?>(body),
      'duration': serializer.toJson<int>(duration),
      'priority': serializer.toJson<int>(priority),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  Todo copyWith(
          {int? id,
          String? title,
          Value<String?> body = const Value.absent(),
          int? duration,
          int? priority,
          String? createdAt,
          String? updatedAt}) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body.present ? body.value : this.body,
        duration: duration ?? this.duration,
        priority: priority ?? this.priority,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('duration: $duration, ')
          ..write('priority: $priority, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, body, duration, priority, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.duration == this.duration &&
          other.priority == this.priority &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> body;
  final Value<int> duration;
  final Value<int> priority;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.duration = const Value.absent(),
    this.priority = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.body = const Value.absent(),
    required int duration,
    required int priority,
    required String createdAt,
    required String updatedAt,
  })  : title = Value(title),
        duration = Value(duration),
        priority = Value(priority),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<int>? duration,
    Expression<int>? priority,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (duration != null) 'duration': duration,
      if (priority != null) 'priority': priority,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? body,
      Value<int>? duration,
      Value<int>? priority,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      duration: duration ?? this.duration,
      priority: priority ?? this.priority,
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
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('duration: $duration, ')
          ..write('priority: $priority, ')
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
  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, body, duration, priority, createdAt, updatedAt];
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
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
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
      duration: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      priority: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  Todos createAlias(String alias) {
    return Todos(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Statistic extends DataClass implements Insertable<Statistic> {
  final int id;
  final int? todoId;
  final int progress;
  final String createdAt;
  const Statistic(
      {required this.id,
      this.todoId,
      required this.progress,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || todoId != null) {
      map['todo_id'] = Variable<int>(todoId);
    }
    map['progress'] = Variable<int>(progress);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  StatisticsCompanion toCompanion(bool nullToAbsent) {
    return StatisticsCompanion(
      id: Value(id),
      todoId:
          todoId == null && nullToAbsent ? const Value.absent() : Value(todoId),
      progress: Value(progress),
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
      createdAt: serializer.fromJson<String>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'todo_id': serializer.toJson<int?>(todoId),
      'progress': serializer.toJson<int>(progress),
      'created_at': serializer.toJson<String>(createdAt),
    };
  }

  Statistic copyWith(
          {int? id,
          Value<int?> todoId = const Value.absent(),
          int? progress,
          String? createdAt}) =>
      Statistic(
        id: id ?? this.id,
        todoId: todoId.present ? todoId.value : this.todoId,
        progress: progress ?? this.progress,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Statistic(')
          ..write('id: $id, ')
          ..write('todoId: $todoId, ')
          ..write('progress: $progress, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, todoId, progress, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Statistic &&
          other.id == this.id &&
          other.todoId == this.todoId &&
          other.progress == this.progress &&
          other.createdAt == this.createdAt);
}

class StatisticsCompanion extends UpdateCompanion<Statistic> {
  final Value<int> id;
  final Value<int?> todoId;
  final Value<int> progress;
  final Value<String> createdAt;
  const StatisticsCompanion({
    this.id = const Value.absent(),
    this.todoId = const Value.absent(),
    this.progress = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  StatisticsCompanion.insert({
    this.id = const Value.absent(),
    this.todoId = const Value.absent(),
    this.progress = const Value.absent(),
    required String createdAt,
  }) : createdAt = Value(createdAt);
  static Insertable<Statistic> custom({
    Expression<int>? id,
    Expression<int>? todoId,
    Expression<int>? progress,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (todoId != null) 'todo_id': todoId,
      if (progress != null) 'progress': progress,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  StatisticsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? todoId,
      Value<int>? progress,
      Value<String>? createdAt}) {
    return StatisticsCompanion(
      id: id ?? this.id,
      todoId: todoId ?? this.todoId,
      progress: progress ?? this.progress,
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
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatisticsCompanion(')
          ..write('id: $id, ')
          ..write('todoId: $todoId, ')
          ..write('progress: $progress, ')
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
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, todoId, progress, createdAt];
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
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  Statistics createAlias(String alias) {
    return Statistics(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$MDatabase extends GeneratedDatabase {
  _$MDatabase(QueryExecutor e) : super(e);
  late final Todos todos = Todos(this);
  late final Statistics statistics = Statistics(this);
  Future<int> insertStatistic(int? var1, String var2) {
    return customInsert(
      'INSERT INTO statistics (todo_id, created_at) VALUES (?1, ?2)',
      variables: [Variable<int>(var1), Variable<String>(var2)],
      updates: {statistics},
    );
  }

  Future<int> updateStatistic(int var1, int var2, String var3) {
    return customUpdate(
      'UPDATE statistics SET progress = ?1 WHERE id = ?2 AND created_at = ?3',
      variables: [
        Variable<int>(var1),
        Variable<int>(var2),
        Variable<String>(var3)
      ],
      updates: {statistics},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteTodoStatistics(int? var1) {
    return customUpdate(
      'DELETE FROM statistics WHERE todo_id = ?1',
      variables: [Variable<int>(var1)],
      updates: {statistics},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Statistic> getStatisticById(int var1, String var2) {
    return customSelect(
        'SELECT * FROM statistics WHERE id = ?1 AND created_at = ?2',
        variables: [
          Variable<int>(var1),
          Variable<String>(var2)
        ],
        readsFrom: {
          statistics,
        }).asyncMap(statistics.mapFromRow);
  }

  Selectable<Statistic> getStatisticByTodoId(int? var1, String var2) {
    return customSelect(
        'SELECT * FROM statistics WHERE todo_id = ?1 AND created_at = ?2',
        variables: [
          Variable<int>(var1),
          Variable<String>(var2)
        ],
        readsFrom: {
          statistics,
        }).asyncMap(statistics.mapFromRow);
  }

  Future<int> insertTodo(
      String var1, String? var2, int var3, int var4, String var5, String var6) {
    return customInsert(
      'INSERT INTO todos (title, body, duration, priority, created_at, updated_at) VALUES (?1, ?2, ?3, ?4, ?5, ?6)',
      variables: [
        Variable<String>(var1),
        Variable<String>(var2),
        Variable<int>(var3),
        Variable<int>(var4),
        Variable<String>(var5),
        Variable<String>(var6)
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
      String var1, String? var2, int var3, int var4, String var5, int var6) {
    return customUpdate(
      'UPDATE todos SET title = ?1, body = ?2, duration = ?3, priority = ?4, updated_at = ?5 WHERE id = ?6',
      variables: [
        Variable<String>(var1),
        Variable<String>(var2),
        Variable<int>(var3),
        Variable<int>(var4),
        Variable<String>(var5),
        Variable<int>(var6)
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

  Selectable<TodosWithStatisticResult> todosWithStatistic() {
    return customSelect(
        'SELECT"t"."id" AS "nested_0.id", "t"."title" AS "nested_0.title", "t"."body" AS "nested_0.body", "t"."duration" AS "nested_0.duration", "t"."priority" AS "nested_0.priority", "t"."created_at" AS "nested_0.created_at", "t"."updated_at" AS "nested_0.updated_at","s"."id" AS "nested_1.id", "s"."todo_id" AS "nested_1.todo_id", "s"."progress" AS "nested_1.progress", "s"."created_at" AS "nested_1.created_at" FROM todos AS t LEFT OUTER JOIN statistics AS s ON t.id = s.todo_id AND date(s.created_at) = date(\'now\') WHERE unixepoch(t.created_at) <= unixepoch(\'now\', \'localtime\') ORDER BY t.priority DESC',
        variables: [],
        readsFrom: {
          todos,
          statistics,
        }).asyncMap((QueryRow row) async {
      return TodosWithStatisticResult(
        todo: await todos.mapFromRow(row, tablePrefix: 'nested_0'),
        statistic:
            await statistics.mapFromRowOrNull(row, tablePrefix: 'nested_1'),
      );
    });
  }

  Selectable<GetDatesResult> getDates() {
    return customSelect(
        'SELECT unixepoch(created_at) AS _c0, unixepoch(\'now\', \'localtime\') AS _c1 FROM todos',
        variables: [],
        readsFrom: {
          todos,
        }).map((QueryRow row) {
      return GetDatesResult(
        unixepochcreatedAt: row.readNullable<DateTime>('_c0'),
        unixepochnowlocaltime: row.readNullable<DateTime>('_c1'),
      );
    });
  }

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos, statistics];
}

class TodosWithStatisticResult {
  final Todo todo;
  final Statistic? statistic;
  TodosWithStatisticResult({
    required this.todo,
    this.statistic,
  });
}

class GetDatesResult {
  final DateTime? unixepochcreatedAt;
  final DateTime? unixepochnowlocaltime;
  GetDatesResult({
    this.unixepochcreatedAt,
    this.unixepochnowlocaltime,
  });
}
