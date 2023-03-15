import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvents,NewsStates>
{
  NewsRepository newsRepository;
  NewsBloc({required NewsStates initialState, required this.newsRepository}) :super(initialState);


  @override

  Stream<NewsStates> mapEventToStates(NewsEvents event) async*{
    if (event is StartEvent)
    {
     try{
          List<ArticleModel> _articleList= [];
          yield NewsInitState();
          _articleList=await newsRepository.fetchNews();
          yield NewsLoadedState(articleList: _articleList);
     }
     catch(e){
     }
    }
  }
}