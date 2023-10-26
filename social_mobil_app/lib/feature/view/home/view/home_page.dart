import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'dart:math' as math;
import 'package:badges/badges.dart' as badges;
import 'package:social_mobil_app/core/base/model/base_view_model.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';
import 'package:social_mobil_app/feature/_product/_constants/rive_theme.dart';
import 'package:social_mobil_app/feature/_product/_widgets/drawer/message_drawer.dart';
import 'package:social_mobil_app/feature/_product/_widgets/drawer/sidebar_menu.dart';
import 'package:social_mobil_app/feature/view/discover/view/discover_page.dart';
import 'package:social_mobil_app/feature/view/homes/view/homes_page.dart';
import 'package:social_mobil_app/feature/view/notification/view/notification_page.dart';
import 'package:social_mobil_app/feature/view/profil/view/profil_page.dart';

class HomesPage extends ConsumerStatefulWidget {
  const HomesPage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState
    with BaseViewModel, TickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();
  final key = GlobalKey();
  int _currentPage = 0;
  int? id;
  late AnimationController? _animationController;
  late AnimationController? _onBoardingAnimController;
  late Animation<double> _onBoardingAnim;
  late Animation<double> _sidebarAnim;
  PageController? _pageController;
  late SMIBool _menuBtn;
  //int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  bool _showOnBoarding = false;
  //Widget _tabBody = Container(color: RiveAppTheme.background);

  final springDesc = const SpringDescription(
    mass: 0.1,
    stiffness: 40,
    damping: 5,
  );

  void _onMenuIconInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "State Machine");
    artboard.addController(controller!);
    _menuBtn = controller.findInput<bool>("isOpen") as SMIBool;
    _menuBtn.value = true;
  }

  void _presentOnBoarding(bool show) {
    if (show) {
      setState(() {
        _showOnBoarding = true;
      });
      final springAnim = SpringSimulation(springDesc, 0, 1, 0);
      _onBoardingAnimController?.animateWith(springAnim);
    } else {
      _onBoardingAnimController?.reverse().whenComplete(() => {
            setState(() {
              _showOnBoarding = false;
            })
          });
    }
  }

  void onMenuPress() {
    if (_menuBtn.value) {
      final springAnim = SpringSimulation(springDesc, 0, 1, 0);
      _animationController?.animateWith(springAnim);
    } else {
      _animationController?.reverse();
    }
    _menuBtn.change(!_menuBtn.value);

    SystemChrome.setSystemUIOverlayStyle(_menuBtn.value
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light);
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      upperBound: 1,
      vsync: this,
    );
    _onBoardingAnimController = AnimationController(
      duration: const Duration(milliseconds: 350),
      upperBound: 1,
      vsync: this,
    );

    _sidebarAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.linear,
    ));

    _onBoardingAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _onBoardingAnimController!,
      curve: Curves.linear,
    ));
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _onBoardingAnimController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,

        //backgroundColor:Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        leading: GestureDetector(
          onTap: onMenuPress,
          child: Container(
            /*   width: 20,
            height: 20, */
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: RiveAppTheme.shadow.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 5))
              ],
              //borderRadius: BorderRadius.circular(20 / 2),
            ),
            child: RiveAnimation.asset(
              "asset/samples/ui/rive_app/rive/menu_button.riv",
              stateMachines: ["State Machine"],
              animations: ["open", "closed"],
              onInit: _onMenuIconInit,
            ),
          ),
        ),
        /* InkWell(
          child: const Icon(
            //your preferred icon
            Icons.menu, color: Colors.white, size: 30,
          ),
          onTap: () {
            !_scaffoldKey.currentState!.isEndDrawerOpen
                ? _scaffoldKey.currentState?.openDrawer()
                : null;
          },
        ),*/
        actions: [
          /*  InkWell(
          child: Icon(
              //your preferred icon
              Icons.message),
          onTap: () {
            Scaffold.of(context).hasEndDrawer;
          },
        ) */
          IconButton(
            onPressed: () {},
            icon: badges.Badge(
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.white,
              ),
              badgeContent: Text("1"),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            iconSize: 30,
          ),
          IconButton(
              icon: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                badgeContent: Text("3"),
                child: const Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                ),
              ),
              iconSize: 30,
              onPressed: () => !_scaffoldKey.currentState!.isEndDrawerOpen
                  ? _scaffoldKey.currentState?.openEndDrawer()
                  : null)
        ],
        shadowColor: Colors.deepPurpleAccent,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10), child: Text("")),
        centerTitle: true,
        title: Form(
            key: key,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 3),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              // color: Colors.red,
              width: 250,
              height: 40,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                controller: _textEditingController,
                maxLines: 1,
                onChanged: (value) {},
                style: const TextStyle(
                  fontSize: 12, //This line!!!!!!!!!
                  textBaseline: TextBaseline.alphabetic,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    // alignment: Alignment.topCenter,
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    iconSize: 30,
                  ),
                  border: InputBorder.none,
                  hintText: "Arama Yapınız ",
                  //configNotifier.translationObject["SearchOrder"],
                  hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      textBaseline: TextBaseline.alphabetic),
                ),
              ),
            )),
      ),
      endDrawer: const MessageDraver(),
      // backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          fit: StackFit.loose,
          children: [
            // Positioned(child: Container(color: context.colors.primary)),
            SideMenu(),
            AnimatedBuilder(
              animation: _sidebarAnim,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_sidebarAnim.value * 230, 0),
                  child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(
                          (_sidebarAnim.value * 20) * math.pi / 180,
                        ),
                      child: child),
                );
              },
              child: Container(
                //margin: EdgeInsets.only(top: 30),
                color: Colors.white,
                child: PageView(
                  //physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (openPage) {
                    setState(() {
                      _currentPage = openPage;
                    });
                  },
                  controller: _pageController,
                  children: const <Widget>[
                    HomePage(),
                    DiscoverPage(),
                    NotificationPage(),
                    ProfilPage()
                  ],
                ),
              ),
            ),
            /*  SafeArea(
                child: GestureDetector(
              onTap: onMenuPress,
              child: Container(
                width:44,
                height: 44,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  boxShadow: [
                    BoxShadow(
                        color: RiveAppTheme.shadow.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ],
                  //borderRadius: BorderRadius.circular(44 / 2)
                ),
                child: RiveAnimation.asset(
                  "asset/samples/ui/rive_app/rive/menu_button.riv",
                  stateMachines: ["State Machine"],
                  animations: ["open", "closed"],
                  onInit: _onMenuIconInit,
                ),
              ),
            )) */
          ],
        ),
      ),
      /* bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.purple,
          //Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          //elevation: 245,
          /*  selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black, */
          mouseCursor: MouseCursor.uncontrolled,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.discord,
                  size: 20,
                ),
                label: 'Discover'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 20,
                ),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 20,
                ),
                label: 'Profil'),
          ],
          currentIndex: _currentPage,
          // selectedFontSize: 10,

          //  selectedItemColor: Colors.amber[800],
          onTap: (selectPage) {
            setState(() {
              _pageController?.jumpToPage(selectPage);
            });
          }), */
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        animationCurve: Curves.bounceOut,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: context.colors.primary,
        height: 60.0,
        //color: Colors.deepPurple.shade200,
        index: _currentPage,
        items: [
          Icon(
            Icons.home,
            size: 25,
            color: context.colors.primary,
          ),
          Icon(Icons.compare_arrows, size: 25, color: context.colors.primary),
          badges.Badge(
              badgeStyle: badges.BadgeStyle(
                badgeColor: context.colors.onPrimary,
              ),
              badgeContent: Text(
                "3",
                style: context.textTheme.bodySmall!
                    .copyWith(color: context.colors.primary),
              ),
              child: Icon(
                Icons.notifications,
                size: 25,
                color: context.colors.primary,
              )),
          Icon(
            Icons.person,
            size: 25,
            color: context.colors.primary,
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageController?.jumpToPage(index);
            //index = _currentPage;
          });
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(6),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          backgroundColor: context.colors.primary,
          tooltip: "Add Post",
          elevation: 5,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
