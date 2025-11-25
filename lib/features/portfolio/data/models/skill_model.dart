import 'package:flutter/widgets.dart';
import '../../domain/entities/skill.dart';

class SkillModel extends Skill {
  const SkillModel({
    required super.name,
    required super.icon,
  });

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      name: map['name'],
      icon: map['icon'] as IconData,
    );
  }
}
