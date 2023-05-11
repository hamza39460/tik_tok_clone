import 'package:tiktok_clone/models/correct_answer.dart';

class ForYouModel {
  String? type;
  int? id;
  String? playlist;
  String? description;
  String? question;
  List<Options>? options;
  User? user;
  CorrectAnswer? correctAnswer;

  ForYouModel(
      {this.type,
      this.id,
      this.playlist,
      this.description,
      this.question,
      this.options,
      this.user});

  ForYouModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    playlist = json['playlist'];
    description = json['description'];
    question = json['question'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['playlist'] = playlist;
    data['description'] = description;
    data['question'] = question;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Options {
  String? id;
  String? answer;

  Options({this.id, this.answer});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }
}

class User {
  String? name;
  String? avatar;

  User({this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}
