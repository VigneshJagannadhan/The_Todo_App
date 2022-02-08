import 'package:json_annotation/json_annotation.dart';
import 'package:the_todo_app/interface_models/todo_i_model.dart';
import 'package:the_todo_app/models/base_model.dart';
part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends BaseModel implements ITodoModel{
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'todoTitle')
  String? todoTitle;

  @JsonKey(name: 'todoSubtitle')
  String? todoSubtitle;

  @JsonKey(name: 'isCompleted')
  bool? isCompleted;

  @JsonKey(name: 'isPriority')
  bool? isPriority;

  @JsonKey(name: 'category')
  String? category;

  TodoModel({
    this.id,
    this.todoTitle,
    this.todoSubtitle,
    this.isCompleted,
    this.isPriority,
    this.category,
  });
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  @override
  bool? get iIsCompleted => isCompleted;

  @override
  String? get iId => id;

  @override
  String? get iTodoTitle => todoTitle;

  @override
  String? get iTodoSubTitle => todoSubtitle;

  @override
  bool? get iIsPriority => isPriority;

  @override
  String? iCategory;

  @override
  String? iTodoSubtitle;

  @override
  set iId(String? _iId) {
    // TODO: implement iId
  }

  @override
  set iIsCompleted(bool? _iIsCompleted) {
    // TODO: implement iIsCompleted
  }

  @override
  set iIsPriority(bool? _iIsPriority) {
    // TODO: implement iIsPriority
  }

  @override
  set iTodoTitle(String? _iTodoTitle) {
    // TODO: implement iTodoTitle
  }
}
