import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/categories.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

  CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, newDetailsScreen, arguments: category),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.grey.shade300,
                        image: category.previewPath != null
                            ? DecorationImage(
                                image: NetworkImage(category.previewPath!),
                                fit: BoxFit.cover)
                            : null),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                    flex: 3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              category.title!.toUpperCase(),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 60,
                            child: Html(
                              data: category.text,
                              style: {
                                '#': Style(
                                  margin: EdgeInsets.all(5),
                                  maxLines: 3,
                                  fontStyle: FontStyle.italic,
                                  fontSize: FontSize.small,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              },
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  DateFormat("dd.MM.yy")
                                      .format(category.dateTime!),
                                  style: TextStyle(
                                    height: 1.4,
                                    fontSize: 12,
                                    color: MyColors.myGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  category.language!.toUpperCase(),
                                  style: TextStyle(
                                    height: 1.4,
                                    fontSize: 12,
                                    color: MyColors.myGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
