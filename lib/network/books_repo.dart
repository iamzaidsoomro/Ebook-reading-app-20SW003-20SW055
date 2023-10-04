import 'package:http/http.dart' as http;

class BooksRepo {
  Future<String> getBooks() async {
    var headers = {
      'X-RapidAPI-Key': '37620eccc1msha8766c22b64e086p1c29fdjsn89264391a5cc',
      'X-RapidAPI-Host': 'freebooks-api2.p.rapidapi.com'
    };
    var url = Uri.parse(
        'https://freebooks-api2.p.rapidapi.com/fetchEbooks/technology');
    var response = await http.get(url, headers: headers);
    return response.body;
  }
}
