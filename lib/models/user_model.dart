import 'package:frontend/models/transaction_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'current_balance')
  double? currentBalance;
  @JsonKey(name: 'invested_amount')
  double? investedAmount;
  @JsonKey(name: 'total_returns')
  double? totalReturns;
  @JsonKey(name: 'pan_number')
  String? panNumber;
  @JsonKey(name: 'transaction_list')
  List<TransactionModel> transactionList;

  User(
      {this.fullName,
      this.email,
      this.phoneNumber,
      this.currentBalance,
      this.investedAmount,
      this.totalReturns,
      this.panNumber,
      this.transactionList = const []});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
