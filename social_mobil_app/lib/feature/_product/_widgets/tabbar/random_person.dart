import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/base/model/base_view_model.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';

class RandomPage extends StatefulWidget {
  final BuildContext context;

  const RandomPage({super.key, required this.context});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> with BaseViewModel {
  PageController controller = PageController();
  double currentPageValue = 0.0;

  bool _color = false;
  late List pageViewItem = [
    page(currentPageValue, Colors.tealAccent),
    page(2, Colors.amber),
    page(3, Colors.cyan),
    page(3, Colors.red),
    page(3, Colors.blue),
    page(3, Colors.black),
    page(3, Colors.yellow),
    page(
      3,
      Colors.purple,
    ),
    page(3, Colors.amber),
    page(3, Colors.orange)
  ];
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
    if (controller.hasClients) {
      controller.animateToPage(currentPageValue.ceil(),
          duration: const Duration(milliseconds: 1500), curve: Curves.ease);
    }
  }

  /*  controller.animateToPage(currentPageValue.round(),
        duration: const Duration(milliseconds: 500), curve: Curves.ease); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  Text("Discover",
                      style: context.textTheme.headlineLarge!
                          .copyWith(color: Colors.black)
                      // .copyWith(fontWeight: FontWeight.bold),
                      ),
                  IconButton(
                      onPressed: () {
                        /*  navigation.navigateToPageClear(
                            path: NavigationConstants.FILTER_DISCOVER); */

                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            double value1 = 0.0;
                            double startValue = 0.0;
                            double endValue = 0.0;
                            return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          "Filters",
                                          style: context.textTheme.bodyLarge!
                                              .copyWith(fontSize: 30),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Clear",
                                              style: context
                                                  .textTheme.bodyLarge!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      color: context
                                                          .colors.primary),
                                            ))
                                      ]),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 15),
                                        child: const Text(
                                          "Interested In",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            height: 70,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20)),
                                                    side: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                foregroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (_color == true) {
                                                      return Colors.white;
                                                    }
                                                    //<-- SEE HERE
                                                    return Colors
                                                        .black; // Defer to the widget's default.
                                                  },
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (_color == true) {
                                                      return Colors.redAccent;
                                                    }
                                                    //<-- SEE HERE
                                                    return Colors
                                                        .white; // Defer to the widget's default.
                                                  },
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _color = !_color;
                                                });
                                              },
                                              child: const Text(
                                                "Girls",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            height: 70,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                fixedSize: MaterialStateProperty
                                                    .resolveWith<Size?>(
                                                  (Set<MaterialState>
                                                      states) {
                                                        return null;
                                                      },
                                                ),
                                                foregroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (_color == true) {
                                                      return Colors.white;
                                                    }
                                                    //<-- SEE HERE
                                                    return Colors
                                                        .black; // Defer to the widget's default.
                                                  },
                                                ),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (_color == true) {
                                                      return Colors.redAccent;
                                                    }
                                                    //<-- SEE HERE
                                                    return Colors
                                                        .white; // Defer to the widget's default.
                                                  },
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _color = !_color;
                                                });
                                              },
                                              child: const Text(
                                                "Boys",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            height: 70,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                    side: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                foregroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (_color == true) {
                                                      return Colors.white;
                                                    }
                                                    //<-- SEE HERE
                                                    return Colors
                                                        .black; // Defer to the widget's default.
                                                  },
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (_color == true) {
                                                      return Colors.redAccent;
                                                    }
                                                    //<-- SEE HERE
                                                    return Colors
                                                        .white; // Defer to the widget's default.
                                                  },
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _color = !_color;
                                                });
                                              },
                                              child: const Text(
                                                "Both",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Distance",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "`${value1.round().toString()}`km",
                                                      style: const TextStyle(
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                                Slider(
                                                  min: 0.0,
                                                  max: 1000.0,
                                                  value: value1,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      value1 = value;
                                                    });
                                                  },
                                                  activeColor:
                                                      context.colors.primary,
                                                  inactiveColor:
                                                      Colors.purple.shade100,
                                                  /*  inactiveColor:
                                                  context.colors.onPrimary, */

                                                  label: '${value1.round()}',
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Age",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "`${startValue.round().toString()}-${endValue.round().toString()}`",
                                                      style: const TextStyle(
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                                RangeSlider(
                                                  max: 100.0,
                                                  min: 0.0,
                                                  values: RangeValues(
                                                      startValue, endValue),
                                                  labels: RangeLabels(
                                                    startValue
                                                        .round()
                                                        .toString(),
                                                    endValue
                                                        .round()
                                                        .toString(),
                                                  ),
                                                  activeColor:
                                                      context.colors.primary,
                                                  inactiveColor:
                                                      Colors.purple.shade100,
                                                  /*  inactiveColor:
                                                  context.colors.onPrimary, */
                                                  onChanged: (value) {
                                                    setState(() {
                                                      startValue =
                                                          value.start;
                                                      debugPrint(startValue
                                                          .toString());
                                                      debugPrint(endValue
                                                          .toString());
                                                      endValue = value.end;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 70,
                                        child: TextButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                borderRadius:  BorderRadius.all(
                                                    Radius.circular(20)),
                                                side: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                                if (_color == true) {
                                                  return Colors.white;
                                                }
                                                //<-- SEE HERE
                                                return Colors
                                                    .white; // Defer to the widget's default.
                                              },
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                                //<-- SEE HERE
                                                return context.colors
                                                    .primary; // Defer to the widget's default.
                                              },
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _color = !_color;
                                            });
                                          },
                                          child: const Text(
                                            "Continue",
                                            style: TextStyle(
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]);
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.format_list_bulleted_outlined,
                        size: 35,
                      ))
                ],
              )),
          Expanded(
            flex: 8,
            child: PageView.builder(
                itemCount: pageViewItem.length,
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemBuilder: (context, position) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(currentPageValue - position),
                    child: pageViewItem[position],
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.plus_one,
                        color: Colors.red,
                        size: 40,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.heart_broken_outlined,
                        color: Colors.red,
                        size: 70,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.purple,
                        size: 40,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget page(
    double pageno,
    Color color,
  ) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/img/post.jpg"),
                    fit: BoxFit.cover)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.heart_broken,
                  size: 60,
                  color: Colors.white,
                ))),
        Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              padding: context.paddingLow,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    height: 50,
                    //color: Colors.blueAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Melek ,",
                          style: context.textTheme.headlineMedium!
                              .copyWith(color: context.colors.onPrimary),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "26",
                          style: context.textTheme.headlineMedium!
                              .copyWith(color: context.colors.onPrimary),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Antalya",
                    style: context.textTheme.headlineMedium!
                        .copyWith(color: context.colors.onPrimary),
                  )
                ],
              ),
            )),
        const Positioned(
            top: 10,
            left: 10,
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "2km",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )),
      ],
    );
  }

  Color getBackgroundColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.selected,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.white;
  }

  Color getTextStyle(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.black;
  }
}
