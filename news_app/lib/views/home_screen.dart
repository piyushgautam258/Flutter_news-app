import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(top: height * 0.05),
            child: ListView.builder(
                itemCount: 10,
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
                                    "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png"),fit: BoxFit.cover)),
                      )
                    ]),
                  );
                }),
          )
        ],
      ),
    );
  }
}
