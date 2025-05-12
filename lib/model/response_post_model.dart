// class ResponsePostModel {
//   String id;
//   String image1;
//   String image2;
//   String image3;
//   String user;
//   String text;
//   ResponsePostModel({
//     required this.id,
//     required this.image1,
//     required this.image2,
//     required this.image3,
//     required this.user,
//     required this.text,
//   });

//   factory ResponsePostModel.fromJson(map) {
//     return ResponsePostModel(
//       id: '',
//       image1: map['image1'],
//       image2: map['image2'],
//       image3: map['image3'],
//       user: map['user'],
//       text: map['text'],
//     );
//   }
// }

// class GetImages {
//   String image1 = '';
//   String image2 = '';
//   String image3 = '';

//   List<String> getImages() {
//     List<String> imgs = [];

//     if (image1.isNotEmpty) {
//       imgs.add(image1);
//     }
//     if (image2.isNotEmpty) {
//       imgs.add(image2);
//     }
//     if (image3.isNotEmpty) {
//       imgs.add(image3);
//     }

//     return imgs;
//   }
// }

class ResponsePostModel {
  String id;
  final String image1;
  final String image2;
  final String image3;
  final String user;
  final String text;

  ResponsePostModel({
    required this.id,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.user,
    required this.text,
  });

 
  factory ResponsePostModel.fromJson(Map<String, dynamic> map) {
    return ResponsePostModel(
      id: map['id'] ?? '', 
      image1: map['image1'] ?? '',
      image2: map['image2'] ?? '',
      image3: map['image3'] ?? '',
      user: map['user'] ?? '',
      text: map['text'] ?? '',
    );
  }

 
  List<String> getImages() {
    List<String> imgs = [];

    if (image1.isNotEmpty) imgs.add(image1);
    if (image2.isNotEmpty) imgs.add(image2);
    if (image3.isNotEmpty) imgs.add(image3);

    return imgs;
  }
}



