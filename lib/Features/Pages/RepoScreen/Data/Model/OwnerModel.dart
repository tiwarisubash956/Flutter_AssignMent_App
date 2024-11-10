import 'dart:ffi';

class Owner {
  final String login;
  final String avatarUrl;
  final String htmlUrl;
  final int id;

  Owner({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.id
  });

  @override
  String toString() {
    return 'Owner(login: $login, avatarUrl: $avatarUrl, htmlUrl: $htmlUrl,id:$id)';
  }

  // Factory method to create an Owner object from JSON
  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      htmlUrl: json['html_url'],
      id: json['id']
    );
  }
}