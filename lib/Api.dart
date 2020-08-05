import 'package:http/http.dart' as http;
import 'dart:convert';


const CHAVE_YOUTUBE_API = "AIzaSyDL2L7A5s4fPZUArad1VcK9iL0lswPEw9A";
const ID_CANAL = "UCtrjFP7i92_30uv6IehwE5Q";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  pesquisar(String pesquisa) async{
    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL"
          "&q=$pesquisa"
    );

    if(response.statusCode == 20){
      Map<String, dynamic> dadosJson = json.decode(response.body);
      print("resultado: " + dadosJson["items"].toString());

    }
  }

}