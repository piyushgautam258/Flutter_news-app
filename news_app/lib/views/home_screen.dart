import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repositories/news_repository.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    "Bloc News".toUpperCase(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin:EdgeInsets.only(top:height*0.08),
            child: BlocBuilder<NewsBloc,NewsStates>(builder: (BuildContext context,NewsStates state)
            {
              print("hello"+ state.toString());
              print(NewsRepository().fetchNews());
              if(state is NewsLoadedState){
                return Text("loading");
              } 
              else if(state is NewsLoadedState){
                List<ArticleModel> _articleList = [];
                _articleList=state.articleList;
                return ListView.builder(
                  itemCount: _articleList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey,
                      height: height * 0.18,
                      margin: EdgeInsets.only(bottom: height * 0.02),
                      child: Row(children: [
                        Container(
                          width: width*0.3,
                          height: height*.15,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      _articleList[index].urlToImage!),fit: BoxFit.cover)),
                        )
                      ]),
                    );
                  });
              }
            return Text("center");
            },
            ),
          ),
          
        ],
      ),
    );
  }
}
