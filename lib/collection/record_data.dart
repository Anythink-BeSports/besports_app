class RecordData {
  final DateTime date;
  final String type;
  final int set;
  final int count;

  RecordData(this.date, this.type, this.set, this.count);

  RecordData.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        type = json['type'],
        set = json['set'],
        count = json['count'];

  Map<String, dynamic> toJson() =>
      {
        'date': date,
        'type': type,
        'set': set,
        'count': count
      };
}