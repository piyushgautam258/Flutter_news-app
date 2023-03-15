import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class NewsRepository{
  Future<List<ArticleModel>> fetchNews() async{
    var respone=await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=03d8dc1db7814c4cbd8f1d2ddff9e08d")
    
    );

    var data = jsonDecode(respone.body);
    List<ArticleModel>? _articleModelList=[];
    
    if(respone.statusCode==200){
      for(var item in data["articles"])
      {
        ArticleModel _articleModel=ArticleModel.fromJson(item);
        _articleModelList.add(_articleModel);
      }
      return _articleModelList;
    }
    else{
      _articleModelList=[];
    }
    return _articleModelList;
  }
}