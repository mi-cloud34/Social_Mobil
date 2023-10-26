import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_mobil_app/core/base/model/base_view_model.dart';
import 'package:social_mobil_app/core/constants/app/enums/locale_preferences_enum.dart';
import 'package:social_mobil_app/core/constants/navigation/navigation_constants.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';
import 'package:social_mobil_app/feature/_product/_constants/image_path_svg.dart';
import 'package:social_mobil_app/feature/_product/_widgets/avatar/on_board_circle_avatar.dart';
import '../model/on_board_model.dart';

class OnBoardView extends ConsumerStatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends ConsumerState with BaseViewModel {
  String? token1;

  //LocaleManager? manager;

  Future<SharedPreferences?> getValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref;
  }

  List<OnBoardModel> onBoardItems = [];
  bool isLoading = false;
  int currentIndex = 0;
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @override
  void initState() {
    var token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    debugPrint("tokeninitLoginonboard:`$token`");
    super.initState();
    //token1 = LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN);
    // initPref();
    getValue();
    //token1 = localeManager.getStringValue(PreferencesKeys.TOKEN);
    onBoardItems.addAll([
      OnBoardModel(
          "Chat App", "Uygulamamıza Hoşgeldiniz", SVGImagePaths.instance.one),
      OnBoardModel(
        "Uygulama Hakkında",
        "Uygulamaıza kolaylıkla kaydolup yeni arkadaşlıklar kurabilir mesaj yollayabilirsiniz",
        SVGImagePaths.instance.twoo,
      ),
      OnBoardModel(
        "Kayıt",
        "sağ alta kayıt ekranına gidebilirsiniz",
        SVGImagePaths.instance.three,
      ),
      //OnBoardModel(LocaleKeys.onBoard_page3_title, LocaleKeys.onBoard_page3_desc, SVGImagePaths.instance.one),
    ]);
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      await navigation.navigateToPageClear(
          path: NavigationConstants.FIRST_PAGE);
    }
  }

  Future<void> homePage() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      await navigation.navigateToPageClear(path: NavigationConstants.HOME_VIEW);
    }
  }

  @override
  Widget build(BuildContext context) {
    // token1 = localeManager.getStringValue(PreferencesKeys.TOKEN);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

    return Scaffold(
      body: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          children: [
            const Spacer(),
            Expanded(flex: 5, child: buildPageView(onBoardItems)),
            Expanded(flex: 2, child: buildRowFooter(onBoardItems, context)),
          ],
        ),
      ),
    );
  }

  PageView buildPageView(List<OnBoardModel> boardItems) {
    return PageView.builder(
      itemCount: boardItems.length,
      onPageChanged: (value) {
        changeCurrentIndex(value);
      },
      itemBuilder: (context, index) =>
          buildColumnBody(context, boardItems[index]),
    );
  }

  Row buildRowFooter(List<OnBoardModel> boardItems, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildListViewCircles(boardItems),
        Expanded(
          child: Center(
            child: Visibility(
              visible: isLoading,
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
        buildFloatingActionButtonSkip(context)
      ],
    );
  }

  ListView buildListViewCircles(List<OnBoardModel> items) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return OnBoardCircle(
          radius: currentIndex == index
              ? context.width * 0.015
              : context.width * 0.01,
          color: context.colors.primary
              .withOpacity(currentIndex == index ? 1 : 0.2),
          isSelected: currentIndex == index,
        );
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(
    BuildContext context,
  ) {
    return FloatingActionButton(
        backgroundColor: context.colors.primary,
        child: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () {
          navigation.navigateToPageClear(path: NavigationConstants.WELCOME);

          var token = localeManager.getStringValue(PreferencesKeys.TOKEN);
          debugPrint("tokenLoginonboard:`$token`");
        });
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        )
      ],
    );
  }

  Text buildAutoLocaleTextTitle(
    OnBoardModel model,
    BuildContext context,
  ) {
    return Text(
      model.title,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
    );
  }

  Text buildAutoLocaleTextDescription(
    OnBoardModel model,
    BuildContext context,
  ) {
    return Text(
      model.description,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.w100, color: Colors.black87),
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
