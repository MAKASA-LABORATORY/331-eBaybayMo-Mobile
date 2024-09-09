class ImageCheckHistory {
  final int id;
  final String imageFilename;
  final String response;
  final DateTime timestamp;

  ImageCheckHistory({
    required this.id,
    required this.imageFilename,
    required this.response,
    required this.timestamp,
  });

  // Factory method to create an ImageCheckHistory from JSON
  factory ImageCheckHistory.fromJson(Map<String, dynamic> json) {
    return ImageCheckHistory(
      id: json['id'],
      imageFilename: json['image_filename'],
      response: json['response'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Method to convert ImageCheckHistory object to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'image_filename': imageFilename,
        'response': response,
        'timestamp': timestamp.toIso8601String(),
      };

  // CopyWith method
  ImageCheckHistory copyWith({
    int? id,
    String? imageFilename,
    String? response,
    DateTime? timestamp,
  }) {
    return ImageCheckHistory(
      id: id ?? this.id,
      imageFilename: imageFilename ?? this.imageFilename,
      response: response ?? this.response,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  // Method to modify the response text
  String modifyResponseText() {
    return response
        .replaceAll('T', 'TA')
        .replaceAll('E', 'E/I')
        .replaceAll('O', 'O/U')
        .replaceAll('B', 'BA')
        .replaceAll('K', 'KA')
        .replaceAll('D', 'DA')
        .replaceAll('G', 'GA')
        .replaceAll('H', 'HA')
        .replaceAll('L', 'LA')
        .replaceAll('M', 'MA')
        .replaceAll('N', 'NA')
        .replaceAll('X', 'NGA')
        .replaceAll('P', 'PA')
        .replaceAll('S', 'SA')
        .replaceAll('T', 'TA')
        .replaceAll('W', 'WA')
        .replaceAll('Y', 'YA');
  }
}
