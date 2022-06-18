import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../constants/my_colors.dart';
import '../../data/models/categories.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final Category? category;

  const CategoryDetailsScreen({Key? key, required this.category})
      : super(key: key);

  Widget buildSliverAppBar(String title) {
    return SliverAppBar(
      foregroundColor: MyColors.myWhite,
      expandedHeight: 300,
      pinned: true,
      centerTitle: true,
      backgroundColor: MyColors.myGrey,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          padding: EdgeInsets.all(5),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.left,
            maxLines: 2,
            style: TextStyle(color: MyColors.myWhite, fontSize: 10),
          ),
        ),
        background: category?.previewPath == null
            ? null
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    category!.previewPath!,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                )),
              ),
      ),
    );
  }

  Widget htmlShow(String htmlData) {
    return SingleChildScrollView(
      child: Html(
        data: htmlData,
        tagsList: Html.tags,
        style: {
          "p": Style(
              margin: EdgeInsets.all(10),
              after: '\n',
              padding: EdgeInsets.symmetric(vertical: 10),
              wordSpacing: 0,
              fontSize: FontSize.medium,
              color: Colors.white,
              textAlign: TextAlign.justify,
              fontWeight: FontWeight.w400),
          'a': Style(textDecoration: TextDecoration.none),
          'h2': Style(
              wordSpacing: 0,
              fontSize: FontSize.xLarge,
              color: Color.fromARGB(220, 213, 71, 71),
              textAlign: TextAlign.justify,
              fontWeight: FontWeight.w400),
          'u': Style(
              textDecoration: TextDecoration.none,
              fontSize: FontSize.medium,
              textAlign: TextAlign.justify,
              fontWeight: FontWeight.w400),
          'ul': Style(
              textDecoration: TextDecoration.none,
              fontSize: FontSize.medium,
              textDecorationColor: Colors.white,
              color: Colors.white,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w300),
          'img': Style(height: 5, width: 5)
        },
        customImageRenders: {
          networkSourceMatcher(domains: ["vk.com"]):
              (context, attributes, element) {
            return Image.network(
              attributes["src"] ?? "about:blank",
              semanticLabel: "",
              width: 15,
              height: 15,
              frameBuilder: (ctx, child, frame, _) {
                return child;
              },
            );
          },
        },
      ),
    );
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myLight,
      ),
    );
  }

  Widget scrollImagesPaths(List character) {
    CarouselController buttonCarouselController = CarouselController();
    return Center(
      child: Container(
          width: double.infinity,
          height: 300,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              enlargeCenterPage: true,
              scrollDirection: Axis.vertical,
              autoPlay: false,
            ),
            items: character
                .map((e) => PhotoView(
                      imageProvider: NetworkImage(
                        e,
                      ),
                    ))
                .toList(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(category!.title!),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      category?.additionalImagesPaths!.length == 0
                          ? SizedBox(height: 10)
                          : scrollImagesPaths(category!.additionalImagesPaths!),
                      htmlShow(category!.text!),
                      SizedBox(height: 500)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
