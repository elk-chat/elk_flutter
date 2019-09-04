class Software {
  final int code;
  final String message;
  final Data data;

  Software({this.code, this.message, this.data});

  factory Software.fromJson(Map<String, dynamic> json) {
    return Software(
        code: json['Code'],
        message: json['Message'],
        data: Data.fromJson(json['Data']));
  }
}

class Data {
  final List<Result> results;
  Data({this.results});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['Result'] as List;
    List<Result> relist = list.map((i) => Result.fromJson(i)).toList();
    return Data(results: relist);
  }
}

class Result {
  final String softwareName;
  final Details details;

  Result({this.softwareName, this.details});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        softwareName: json['SoftwareName'],
        details: Details.fromJson(json['Details']));
  }
}

class Details {
  final int id;
  final String createdAt;
  final String softwareName;
  final String fileName;
  final String version;
  final String cdnUrl;
  Details(
      {this.id,
      this.createdAt,
      this.softwareName,
      this.fileName,
      this.version,
      this.cdnUrl});

  factory Details.fromJson(Map<String, dynamic> json) {
    return new Details(
      id: json['ID'],
      createdAt: json['CreatedAt'],
      softwareName: json['SoftwareName'],
      fileName: json['FileName'],
      version: json['Version'],
      cdnUrl: json['CdnUrl'],
    );
  }
}
