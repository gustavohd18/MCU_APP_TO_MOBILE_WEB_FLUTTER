class NewsMarvel {
  NewsMarvel({
    this.title,
    this.data,
    this.time,
    this.link,
  });

  final String title, data, time, link;

  factory NewsMarvel.fromJSON(Map<String, dynamic> json) {
    return NewsMarvel(
      title: json['title'].toString(),
      data: json['data'].toString(),
      time: json['time'].toString(),
      link: "https://www.tecmundo.com.br/marvel/novidades",
    );
  }
}
