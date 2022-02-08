// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'] as String?,
      todoTitle: json['todoTitle'] as String?,
      todoSubtitle: json['todoSubtitle'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      isPriority: json['isPriority'] as bool?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'todoTitle': instance.todoTitle,
      'todoSubtitle': instance.todoSubtitle,
      'isCompleted': instance.isCompleted,
      'isPriority': instance.isPriority,
      'category': instance.category,
    };
