class UserModel {
  String userID;
  String userName;
  String userEmail;
  int userNumber;
  String? userAddress;
  String? proPic;

  UserModel({
    required this.userID,
    required this.userName,
    required this.userEmail,
    required this.userNumber,
    this.userAddress,
    this.proPic,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userID: map['userID'],
      userName: map['userName'],
      userEmail: map['userEmail'],
      userNumber: map['userNumber'],
      userAddress: map['userAddress'],
      proPic: map['proPic'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'userName': userName,
      'userEmail': userEmail,
      'userNumber': userNumber,
      'userAddress': userAddress,
      'proPic': proPic,
    };
  }
}
