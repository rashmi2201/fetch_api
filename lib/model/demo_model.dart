// class DemoPost {
//   int? status;
//   List<Null>? errorDetails;
//   List<Data>? data;

//   DemoPost({this.status, this.errorDetails, this.data});

//   DemoPost.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['errorDetails'] != null) {
//       errorDetails = <Null>[];
//       json['errorDetails'].forEach((v) {
//         errorDetails!.add((v));
//       });
//     }
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.errorDetails != null) {
//       data['errorDetails'] = this.errorDetails!.map((v) => ()).toList();
//     }
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   String? heightid;
//   String? height;
//   String? status;

//   Data({this.heightid, this.height, this.status});

//   Data.fromJson(Map<String, dynamic> json) {
//     heightid = json['heightid'];
//     height = json['height'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['heightid'] = this.heightid;
//     data['height'] = this.height;
//     data['status'] = this.status;
//     return data;
//   }
// }
