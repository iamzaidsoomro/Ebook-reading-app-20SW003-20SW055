import 'package:http/http.dart' as http;

class BooksRepo {
  Future<String> getBooks() async {
    var headers = {
      'X-RapidAPI-Key': '37620eccc1msha8766c22b64e086p1c29fdjsn89264391a5cc',
      'X-RapidAPI-Host': 'mangaverse-api.p.rapidapi.com'
    };
    var url = Uri.parse('https://mangaverse-api.p.rapidapi.com/manga/fetch');
    var response = await http.get(url, headers: headers);
    return response.body;
  }
}
