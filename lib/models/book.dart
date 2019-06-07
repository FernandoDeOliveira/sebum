class Book {
  String _title;
  String _author;
  String _ISBN;
  String _url_photo;
  bool _isAvailable;

  data_like_json () => {
    'title': _title,
    'author': _author,
    'url_photo': _url_photo,
    'ISBN': _ISBN,
    'isAvailabe': _isAvailable
  };

  bool get isAvailable => _isAvailable;

  set isAvailable(bool value) {
    _isAvailable = value;
  }

  String get url_photo => _url_photo;

  set url_photo(String value) {
    _url_photo = value;
  }

  String get ISBN => _ISBN;

  set ISBN(String value) {
    _ISBN = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

}
