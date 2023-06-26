// class CountryCode {
//   List<CountryResult>? countryResult;

//   CountryCode({this.countryResult});

//   CountryCode.fromJson(Map<String, dynamic> json) {
//     if (json['countryResult'] != null) {
//       countryResult = <CountryResult>[];
//       json['countryResult'].forEach((v) {
//         countryResult!.add(new CountryResult.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.countryResult != null) {
//       data['countryResult'] =
//           this.countryResult!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class CountryResult {
  String? name;
  String? dialCode;
  String? code;

  CountryResult({this.name, this.dialCode, this.code});

  CountryResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dialCode = json['dial_code'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dial_code'] = this.dialCode;
    data['code'] = this.code;
    return data;
  }

  void clear() {}

  void forEach(Null Function(dynamic data) param0) {}

  void add(data) {}
}
