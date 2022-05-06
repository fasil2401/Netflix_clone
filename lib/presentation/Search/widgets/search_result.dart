import 'package:flutter/material.dart';
import 'package:netflix_demo/core/constants.dart';
import 'package:netflix_demo/presentation/Search/widgets/title.dart';
import 'package:netflix_demo/services/constants.dart';
import 'package:netflix_demo/services/http_service.dart';

const imageUrl =
    'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747';

class SearchResultWdget extends StatelessWidget {
  const SearchResultWdget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & Shows'),
        setHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1 / 1.3,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              20,
              (index) {
                return MainCard(index: index,);
              },
            ),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final int index;
   MainCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HttpServices().getUpcoming(Constants.upComing),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${Constants.imageId}${snapshot.data[index].image}'),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
