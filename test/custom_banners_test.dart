import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_banners/custom_banners.dart';

void main() {
  group("Widget tests:", ()
  {
    testWidgets('Test By KEY', (WidgetTester tester) async {
      List<BannerModel> listBanners = [
        BannerModel(
            link:
            'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg',
            image:
            'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg'),
        BannerModel(link:'https://i.pinimg.com/originals/9b/a2/55/9ba255be1da51f06de7b3f18da99fc44.jpg' ,image:'https://i.pinimg.com/originals/9b/a2/55/9ba255be1da51f06de7b3f18da99fc44.jpg' )
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Material(child:  SingleChildScrollView(
            child: Column(children: [
              CustomBannersBase(
                radius: 0,
              listBanners: listBanners,
            ),
            ]),
          ),),
        ),
      );
      // Trigger a frame.
      await tester.pump();
      expect(find.byKey(Key('listBanners')), findsOneWidget);
    });
  });
}
