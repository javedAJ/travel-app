import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: 'Discover'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black,
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(
                    text: "Places",
                  ),
                  Tab(
                    text: "Inspiration",
                  ),
                  Tab(
                    text: "Emotions",
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 250,
            width: double.maxFinite,
            // color: Colors.amber.withOpacity(0.5),
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 170,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('img/mountain.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Text('There'),
              Text('Bye'),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLargeText(
                  text: 'Explore more',
                  size: 20,
                ),
                AppText(
                  text: 'See all',
                  color: AppColors.textColor1,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(right: 30),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('img/balloning.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: AppText(
                          text: "red",
                          color: AppColors.textColor2,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
