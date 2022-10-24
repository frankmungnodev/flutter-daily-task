// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Category extends DataClass implements Insertable<Category> {
  final String name;
  final int createdAt;
  final int updatedAt;
  const Category(
      {required this.name, required this.createdAt, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<int>(json['created_at']),
      updatedAt: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'created_at': serializer.toJson<int>(createdAt),
      'updated_at': serializer.toJson<int>(updatedAt),
    };
  }

  Category copyWith({String? name, int? createdAt, int? updatedAt}) => Category(
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> name;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const CategoriesCompanion({
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String name,
    required int createdAt,
    required int updatedAt,
  })  : name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Category> custom({
    Expression<String>? name,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? name, Value<int>? createdAt, Value<int>? updatedAt}) {
    return CategoriesCompanion(
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class Categories extends Table with TableInfo<Categories, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Categories(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
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
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  Categories createAlias(String alias) {
    return Categories(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final String? body;
  final int priority;
  final String? category;
  final int createdAt;
  final int updatedAt;
  const Todo(
      {required this.id,
      required this.title,
      this.body,
      required this.priority,
      this.category,
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
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      priority: Value(priority),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
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
      priority: serializer.fromJson<int>(json['priority']),
      category: serializer.fromJson<String?>(json['category']),
      createdAt: serializer.fromJson<int>(json['created_at']),
      updatedAt: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String?>(body),
      'priority': serializer.toJson<int>(priority),
      'category': serializer.toJson<String?>(category),
      'created_at': serializer.toJson<int>(createdAt),
      'updated_at': serializer.toJson<int>(updatedAt),
    };
  }

  Todo copyWith(
          {int? id,
          String? title,
          Value<String?> body = const Value.absent(),
          int? priority,
          Value<String?> category = const Value.absent(),
          int? createdAt,
          int? updatedAt}) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body.present ? body.value : this.body,
        priority: priority ?? this.priority,
        category: category.present ? category.value : this.category,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('priority: $priority, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, body, priority, category, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.priority == this.priority &&
          other.category == this.category &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> body;
  final Value<int> priority;
  final Value<String?> category;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.priority = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.body = const Value.absent(),
    required int priority,
    this.category = const Value.absent(),
    required int createdAt,
    required int updatedAt,
  })  : title = Value(title),
        priority = Value(priority),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<int>? priority,
    Expression<String>? category,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (priority != null) 'priority': priority,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? body,
      Value<int>? priority,
      Value<String?>? category,
      Value<int>? createdAt,
      Value<int>? updatedAt}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      priority: priority ?? this.priority,
      category: category ?? this.category,
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
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('priority: $priority, ')
          ..write('category: $category, ')
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
  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES categories(name)');
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, body, priority, category, createdAt, updatedAt];
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
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
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
      priority: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      category: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
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
  late final Categories categories = Categories(this);
  late final Todos todos = Todos(this);
  Future<int> insertTodo(
      String var1, String? var2, int var3, String? var4, int var5, int var6) {
    return customInsert(
      'INSERT INTO todos (title, body, priority, category, created_at, updated_at) VALUES (?1, ?2, ?3, ?4, ?5, ?6)',
      variables: [
        Variable<String>(var1),
        Variable<String>(var2),
        Variable<int>(var3),
        Variable<String>(var4),
        Variable<int>(var5),
        Variable<int>(var6)
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
      String var1, String? var2, int var3, String? var4, int var5, int var6) {
    return customUpdate(
      'UPDATE todos SET title = ?1, body = ?2, priority = ?3, category = ?4, updated_at = ?5 WHERE id = ?6',
      variables: [
        Variable<String>(var1),
        Variable<String>(var2),
        Variable<int>(var3),
        Variable<String>(var4),
        Variable<int>(var5),
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

  Future<int> insertCategory(String var1) {
    return customInsert(
      'INSERT INTO categories (name) VALUES (?1)',
      variables: [Variable<String>(var1)],
      updates: {categories},
    );
  }

  Selectable<Category> getAllCategories() {
    return customSelect('SELECT * FROM categories ORDER BY created_at DESC',
        variables: [],
        readsFrom: {
          categories,
        }).asyncMap(categories.mapFromRow);
  }

  Selectable<Category> getCategoryById(String var1) {
    return customSelect('SELECT * FROM categories WHERE name = ?1', variables: [
      Variable<String>(var1)
    ], readsFrom: {
      categories,
    }).asyncMap(categories.mapFromRow);
  }

  Future<int> udateCategoryById(String var1, int var2, String var3) {
    return customUpdate(
      'UPDATE categories SET name = ?1, updated_at = ?2 WHERE name = ?3',
      variables: [
        Variable<String>(var1),
        Variable<int>(var2),
        Variable<String>(var3)
      ],
      updates: {categories},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteCategoryById(String var1) {
    return customUpdate(
      'DELETE FROM categories WHERE name = ?1',
      variables: [Variable<String>(var1)],
      updates: {categories},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories, todos];
}
