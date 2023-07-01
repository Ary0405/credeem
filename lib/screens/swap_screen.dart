import 'dart:ui';

import 'package:flutter/material.dart';
import '../custom_icons.dart';
import '../data/stores_data.dart';
import '../model/store_model.dart';
import '../widgets/store_overview.dart';
import 'dart:math' as math;
import 'package:slide_to_confirm/slide_to_confirm.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  StoreModel _sourceStore = storeData[0];
  StoreModel? _finalStore;

  Future<void> _navigateAndSelectSourceStore(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/select_store');
    if (result != null) {
      setState(() {
        _sourceStore = result as StoreModel;
      });
    }
  }

  Future<void> _navigateAndSelectFinalStore(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/select_store');
    if (result != null) {
      setState(() {
        _finalStore = result as StoreModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      body: SafeArea(
        child: Container(
          // gradient background
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [Color.fromARGB(255, 54, 61, 95), Color(0xff0D1127)],
          //   ),
          // ),
          child: Stack(
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width * .5,
                top: MediaQuery.of(context).size.height * .1,
                child: Image.asset(
                  'assets/ball.png',
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.width * .7,
                ),
              ),
              Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 32, right: 32),
                      child: ScrollConfiguration(
                        behavior: const ScrollBehavior(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Swap Points",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // info icon
                                  Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.info_outline,
                                      color: Color.fromRGBO(255, 255, 255, .2),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              // choose store container with store icon and text
                              StoreOverviewCard(
                                name: _sourceStore.name,
                                points: _sourceStore.points,
                                perksAvailable: _sourceStore.perksAvailable,
                                newPerks: _sourceStore.newPerks,
                                logoUrl: _sourceStore.logoUrl,
                                highlightNewPerks: false,
                                onTap: () => {},
                              ),
                              const SizedBox(height: 15),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(32),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 40.0,
                                    sigmaY: 40.0,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    padding: const EdgeInsets.all(32),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // source store logo in circle white container next to dropdown arrow next to number input field
                                                Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    splashColor: Colors.white
                                                        .withOpacity(.05),
                                                    highlightColor: Colors.white
                                                        .withOpacity(.05),
                                                    onTap: () =>
                                                        _navigateAndSelectSourceStore(
                                                            context),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Image.network(
                                                                  _sourceStore
                                                                      .logoUrl),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          const Icon(
                                                            CustomIcons
                                                                .dropdown,
                                                            color: Colors.white,
                                                            size: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 32),
                                                // number input textfield
                                                Expanded(
                                                  child: Container(
                                                    height: 50,
                                                    width: 100,
                                                    decoration: ShapeDecoration(
                                                      shadows: const [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              255, 54, 61, 95),
                                                          blurRadius: 1,
                                                          offset: Offset(0, 0),
                                                        ),
                                                      ],
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      showCursor: false,
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 30,
                                                                top: 8),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "0",
                                                        hintStyle:
                                                            const TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                        suffixIcon:
                                                            Transform.rotate(
                                                          angle: math.pi * 0.1,
                                                          child: const Icon(
                                                            CustomIcons.star_7,
                                                            color:
                                                                Color.fromRGBO(
                                                                    254,
                                                                    134,
                                                                    173,
                                                                    1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 30),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // source store logo in circle white container next to dropdown arrow next to number input field
                                                Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    splashColor: Colors.white
                                                        .withOpacity(.05),
                                                    highlightColor: Colors.white
                                                        .withOpacity(.05),
                                                    onTap: () =>
                                                        _navigateAndSelectFinalStore(
                                                            context),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: _finalStore ==
                                                                      null
                                                                  ? const Icon(
                                                                      Icons
                                                                          .store,
                                                                      color: Color.fromRGBO(
                                                                          113,
                                                                          99,
                                                                          186,
                                                                          1),
                                                                    )
                                                                  : Image.network(
                                                                      _finalStore!
                                                                          .logoUrl),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          const Icon(
                                                            CustomIcons
                                                                .dropdown,
                                                            color: Colors.white,
                                                            size: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 32),
                                                // number input textfield
                                                Expanded(
                                                  child: Container(
                                                    height: 50,
                                                    width: 100,
                                                    decoration: ShapeDecoration(
                                                      shadows: const [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              255, 54, 61, 95),
                                                          blurRadius: 1,
                                                          offset: Offset(0, 0),
                                                        ),
                                                      ],
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      showCursor: false,
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 30,
                                                                top: 8),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "0",
                                                        hintStyle:
                                                            const TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                        suffixIcon:
                                                            Transform.rotate(
                                                          angle: math.pi * 0.1,
                                                          child: const Icon(
                                                            CustomIcons.star_7,
                                                            color:
                                                                Color.fromRGBO(
                                                                    254,
                                                                    134,
                                                                    173,
                                                                    1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 24.0),
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xff0D1127),
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, .3),
                                                      blurRadius: 3,
                                                      offset: Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  CustomIcons.swap,
                                                  color: Color(0xffA3DDC9),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () =>
                                    {_navigateAndSelectFinalStore(context)},
                                child: _finalStore == null
                                    ? Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 54, 61, 95),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 10),
                                            Icon(
                                              Icons.store,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "Tap to Choose Store",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : StoreOverviewCard(
                                        name: _finalStore!.name,
                                        points: _finalStore!.points,
                                        perksAvailable:
                                            _finalStore!.perksAvailable,
                                        newPerks: _finalStore!.newPerks,
                                        logoUrl: _finalStore!.logoUrl,
                                        highlightNewPerks: false,
                                      ),
                              ),
                              const SizedBox(height: 35),
                              // slde to confirm button
                              ConfirmationSlider(
                                onConfirmation: () => {},
                                stickToEnd: true,
                                sliderButtonContent: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 54, 61, 95),
                                  size: 20,
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 54, 61, 95),
                                textStyle: const TextStyle(
                                  color: Color(0xffA3DDC9),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                                foregroundColor: const Color(0xffA3DDC9),
                                height: 60,
                                width: 250,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
