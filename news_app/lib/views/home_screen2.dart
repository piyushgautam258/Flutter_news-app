import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repositories/news_repository.dart';

class Home_Screen2 extends StatelessWidget {

   NewsRepository newdata=NewsRepository();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(body: FutureBuilder(
      future: newdata.fetchNews(),
      builder:(BuildContext context,AsyncSnapshot<List<ArticleModel>> snapshot){ if(snapshot.hasData){ 
        List<ArticleModel>? datalist=snapshot.data;
        return ListView.builder(
          itemCount: datalist?.length,
          itemBuilder: (context, index) => Column(
            children: [
              ListTile(
                title: Text(datalist![index].title.toString()),

              ),
              Container(
                width: double.infinity,color: Colors.blue,
               child: Column(children: [
                Image.network(datalist[index].urlToImage.toString(),scale: 1,fit: BoxFit.cover),

               ],),
              )
            ],
          ),
          );
      }else{
        return Text("hello");
      }
      }
    ),
    );
  }
}