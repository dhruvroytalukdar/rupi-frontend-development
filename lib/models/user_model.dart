import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User{

  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  User({required this.fullName,required this.email,required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}