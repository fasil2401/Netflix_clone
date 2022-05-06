import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constants.dart';
import 'package:netflix_demo/presentation/Widgets/app_bar_widget.dart';

import '../../services/constants.dart';
import '../../services/http_service.dart';
import 'widgets/downloads_image.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [const _SmartDownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: SafeArea(
                child: CustomAppBar(
              title: 'Downloads',
            ))),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        setWIdth,
        Icon(
          Icons.settings,
          color: textwhitecolor,
        ),
        setWIdth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads For you',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: textwhitecolor),
        ),
        setHeight,
        const Text(
          'We will download a personalised selection of\nmovies and shows for you, so there is\nalways something to watch on your\ndevice.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: FutureBuilder(
              future: HttpServices().getTopRated(Constants.topRated),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.4,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                      DownloadsImageWidget(
                        image: snapshot.data[9].image,
                        margin: const EdgeInsets.only(left: 130, bottom: 50),
                        angle: 20,
                        size: Size(size.width * 0.4, size.width * 0.58),
                      ),
                      DownloadsImageWidget(
                        image: snapshot.data[4].image,
                        margin: const EdgeInsets.only(right: 130, bottom: 50),
                        angle: -20,
                        size: Size(size.width * 0.4, size.width * 0.58),
                      ),
                      DownloadsImageWidget(
                        image: snapshot.data[6].image,
                        margin: const EdgeInsets.only(bottom: 10),
                        size: Size(size.width * 0.45, size.width * 0.65),
                        radius: 8,
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: buttonblue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                  fontSize: 20,
                  color: textwhitecolor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        setHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: buttonwhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See What you can Download',
              style: TextStyle(
                fontSize: 20,
                color: textblackcolor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}
