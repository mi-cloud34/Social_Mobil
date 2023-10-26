import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';
import 'package:social_mobil_app/feature/_product/_widgets/tabbar/get_near_location.dart';
import 'package:social_mobil_app/feature/_product/_widgets/tabbar/get_time.dart';
import 'package:social_mobil_app/feature/_product/_widgets/tabbar/random_person.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TabController? _tabController;


    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Container(
                //margin: const EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(50))),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TabBar(
                        labelStyle: context.textTheme.bodyLarge,
                        unselectedLabelStyle: context.textTheme.bodyMedium,
                        labelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        unselectedLabelColor: Colors.black,
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            text: "Keşfet",
                          ),
                          Tab(
                            text: "Yeni Üyeler",
                          ),
                          Tab(
                            text: "Yakın Konum",
                          )
                        ]))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                       RandomPage(context: context,),
                      const GetTimePage(),
                      const GetNearLocationPage()
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
