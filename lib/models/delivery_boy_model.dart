class DeliveryBoyModel {
  String delvryBoyID;
  String delvryBoyName;
  String delvryBoyEmail;
  String delvryBoyLicenseNumber;
  int delvryBoyMobileNumber;
  String? delvryBoyVehicleNumber;

  DeliveryBoyModel({
    required this.delvryBoyID,
    required this.delvryBoyName,
    required this.delvryBoyEmail,
    required this.delvryBoyLicenseNumber,
    required this.delvryBoyMobileNumber,
    required this.delvryBoyVehicleNumber,
  });

  factory DeliveryBoyModel.fromMap(Map<String, dynamic> map) {
    return DeliveryBoyModel(
      delvryBoyID: map['delvryBoyID'],
      delvryBoyName: map['delvryBoyName'],
      delvryBoyEmail: map['delvryBoyEmail'],
      delvryBoyLicenseNumber: map['delvryBoyLicenseNumber'],
      delvryBoyMobileNumber: map['delvryBoyMobileNumber'],
      delvryBoyVehicleNumber: map['delvryBoyVehicleNumber'] ?? 'Not available',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'delvryBoyID': delvryBoyID,
      'delvryBoyName': delvryBoyName,
      'delvryBoyEmail': delvryBoyEmail,
      'delvryBoyLicenseNumber': delvryBoyLicenseNumber,
      'delvryBoyMobileNumber': delvryBoyMobileNumber,
      'delvryBoyVehicleNumber': delvryBoyVehicleNumber,
    };
  }
}
