
import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';

@JsonSerializable()
class Contact{
  String name;
  String job;
  String age;
  String? id;

  Contact({
        required this.name,
        required this.job,
        required this.age,
        this.id,
    });

    factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

    Map<String, dynamic> toJson() => _$ContactToJson(this);

}