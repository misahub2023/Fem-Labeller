import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultrasound/models/dataset.dart';
import 'package:ultrasound/screens/landing_pg.dart';
import 'package:ultrasound/services/firebase_services.dart';
import 'package:ultrasound/services/sheet.dart';
import 'package:ultrasound/utils/button.dart';
import 'package:ultrasound/utils/menu_drawer.dart';
import 'package:ultrasound/utils/size_configs.dart';

class Labeller extends StatefulWidget {
  //Labeller({super.key, required this.snapshot});
  static const routeName = 'scoring';

  // AsyncSnapshot snapshot;

  @override
  State<Labeller> createState() => _LabellerState();
}

class _LabellerState extends State<Labeller> {
  String opt1 = '0';
  String opt2 = '0';
  String opt3 = '0';
  String opt4 = '0';
  String opt5 = '0';
  String opt6 = '0';
  String opt7 = '0';
  String opt8 = '0';
  String opt9 = '0';
  String opt10 = '0';
  String opt11 = '0';
  String opt12 = '0';
  String opt13 = '0';
  String opt14 = '0';
  String opt15 = '0';
  String opt16 = '0';
  String opt17 = '0';
  String opt18 = '0';
  String opt19 = '0';
  String opt20 = '0';
  String opt21 = '0';
  String opt22 = '0';
  String opt23 = '0';
  String opt24 = '0';
  String opt25 = '0';
  String opt26 = '0';
  String opt27 = '0';
  String opt28 = '0';
  String opt29 = '0';
  String opt30 = '0';
  String opt31 = '0';
  String opt32 = '0';
  String opt33 = '0';
  String opt34 = '0';
  String opt35 = '0';
  String opt36 = '0';
  String opt37 = '0';
  String opt38 = '0';
  String opt39 = '0';
  String opt40 = '0';
  static var index = 0;
  bool sel1 = false;
  bool sel2 = false;
  bool sel3 = false;
  bool sel4 = false;
  bool sel5 = false;
  bool sel6 = false;
  bool sel7 = false;
  bool sel8 = false;
  bool sel9 = false;
  bool sel10 = false;
  bool sel11 = false;
  bool sel12 = false;
  bool sel13 = false;
  bool sel14 = false;
  bool sel15 = false;
  bool sel16 = false;
  bool sel17 = false;
  bool sel18 = false;
  bool sel19 = false;
  bool sel20 = false;
  bool sel21 = false;
  bool sel22 = false;
  bool sel23 = false;
  bool sel24 = false;
  bool sel25 = false;
  bool sel26 = false;
  bool sel27 = false;
  bool sel28 = false;
  bool sel29 = false;
  bool sel30 = false;
  bool sel31 = false;
  bool sel32 = false;
  bool sel33 = false;
  bool sel34 = false;
  bool sel35 = false;
  bool sel36 = false;
  bool sel37 = false;
  bool sel38 = false;
  bool sel39 = false;
  bool sel40 = false;
  TextEditingController comments = TextEditingController();
  Timer? timer;
  Duration duration = const Duration();
  ScrollController scrollController = ScrollController();
  bool backToTop = false;
  bool choices = false;

  @override
  void initState() {
    startTimer();
    super.initState();

    scrollController.addListener(() {
      setState(() {
        backToTop =
            scrollController.offset == MediaQuery.of(context).size.height
                ? true
                : false;
      });
    });

    isIndex();
  }

  void isIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    index = sp.getInt('index') ?? 0;
    setState(() {});
  }

  void reset() {
    setState(() {
      duration = const Duration();
    });
  }

  void addTimer() {
    const addsec = 1;

    setState(() {
      final sec = duration.inSeconds + addsec;

      duration = Duration(seconds: sec);
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTimer());
  }

  void stopTimer({bool resetTime = true}) {
    if (resetTime) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var len = 2; // widget.snapshot.data.length;
    var viewImage =
        Image.asset('assets/1image40.jpg'); //widget.snapshot.data[index];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: buildTimer(),
        backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
            ),
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              //number of images done
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Frame number : ${(index + 1).toString()}',
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Center(
                child: Container(
                  height: getProportionateScreenHeight(230),
                  width: getProportionateScreenWidth(230),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text("data didn't load"),
                  ),
                  //child: Text(viewImage.toString()),
                  // child: Image.network(
                  //     'http://20.197.24.178/api${viewImage.toString()}'),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              const Text(
                  'Q1. Please choose whether the ultrasound image appears'),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel1 = !sel1;
                        sel2 = false;
                        if (sel1) {
                          opt1 = '1';
                          opt2 = '0';
                        } else {
                          opt1 = '0';
                          opt2 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel1 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Healthy',
                          style: TextStyle(
                            color: sel1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel1 = false;
                        sel2 = !sel2;
                        if (sel2) {
                          opt1 = '0';
                          opt2 = '1';
                        } else {
                          opt1 = '0';
                          opt2 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel2 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Has abnormality',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: sel2 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              const Text(
                'Q2. Please assign an appropriate label to the image from the following:',
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel3 = !sel3;
                    if (sel3) {
                      opt3 = '1';
                    } else {
                      opt3 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel3 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel3 ? Colors.blue : Colors.black,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5),
                    ),
                    const Flexible(
                      child: Text(
                        ' Round and Thin walled with posterior enhancement',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel4 = !sel4;
                    if (sel4) {
                      opt4 = '1';
                    } else {
                      opt4 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel4 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel4 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Cumulus oophorous',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel5 = !sel5;
                    if (sel5) {
                      opt5 = '1';
                    } else {
                      opt5 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel5 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel5 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Corpus luteum',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel6 = !sel6;
                    if (sel6) {
                      opt6 = '1';
                    } else {
                      opt6 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel6 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel6 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Hemorrhagic ovarian cyst',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel7 = !sel7;
                    if (sel7) {
                      opt7 = '1';
                    } else {
                      opt7 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel7 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel7 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Hemorrhagic corpus luteum',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel8 = !sel8;
                    if (sel8) {
                      opt8 = '1';
                    } else {
                      opt8 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel8 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel8 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Endometrioma',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel9 = !sel9;
                    if (sel9) {
                      opt9 = '1';
                    } else {
                      opt9 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel9 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel9 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Serous cystadenoma',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel10 = !sel10;
                    if (sel10) {
                      opt10 = '1';
                    } else {
                      opt10 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel10 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel10 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Serous cystadenocarcinoma',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel11 = !sel11;
                    if (sel8) {
                      opt11 = '1';
                    } else {
                      opt11 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel11 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel11 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Mucinous cystadenoma',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel12 = !sel2;
                    if (sel12) {
                      opt12 = '1';
                    } else {
                      opt12 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel12 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel12 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Mucinous cystadenocarcinoma',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel13 = !sel13;
                    if (sel13) {
                      opt13 = '1';
                    } else {
                      opt13 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel13 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel13 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Dermoid cyst',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel14 = !sel14;
                    if (sel14) {
                      opt14 = '1';
                    } else {
                      opt14 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel14 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel14 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Dermoid plug',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel15 = !sel15;
                    if (sel15) {
                      opt15 = '1';
                    } else {
                      opt15 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel15 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel15 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Rokitansky nodule',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel16 = !sel16;
                    if (sel16) {
                      opt16 = '1';
                    } else {
                      opt16 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel16 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel16 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Dermoid mesh',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel17 = !sel17;
                    if (sel17) {
                      opt17 = '1';
                    } else {
                      opt17 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel17 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel17 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Dot dash pattern',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel18 = !sel18;
                    if (sel18) {
                      opt18 = '1';
                    } else {
                      opt18 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel18 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel18 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Floating balls sign',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel19 = !sel19;
                    if (sel19) {
                      opt19 = '1';
                    } else {
                      opt19 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel19 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel19 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Ovarian fibroma',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel20 = !sel20;
                    if (sel20) {
                      opt20 = '1';
                    } else {
                      opt20 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel20 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel20 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Ovarian thecoma',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel21 = !sel21;
                    if (sel21) {
                      opt21 = '1';
                    } else {
                      opt21 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel21 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel21 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Metastasis',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel22 = !sel22;
                    if (sel22) {
                      opt22 = '1';
                    } else {
                      opt22 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel22 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel22 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Para ovarian cyst',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel23 = !sel23;
                    if (sel23) {
                      opt23 = '1';
                    } else {
                      opt23 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel23 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel23 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Polycystic ovary',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel24 = !sel24;
                    if (sel24) {
                      opt24 = '1';
                    } else {
                      opt24 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel24 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel24 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Ovarian hyperstimulation syndrome',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel25 = !sel25;
                    if (sel25) {
                      opt25 = '1';
                    } else {
                      opt25 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel25 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel25 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Ovarian torsion',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel26 = !sel26;
                    if (sel26) {
                      opt26 = '1';
                    } else {
                      opt26 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel26 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel26 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Thick hyperechoic margin',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel27 = !sel27;
                    if (sel27) {
                      opt27 = '1';
                    } else {
                      opt27 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel27 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel27 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Vaginal ultrasound',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel28 = !sel28;
                    if (sel28) {
                      opt28 = '1';
                    } else {
                      opt28 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel28 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel28 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Right ovary',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel29 = !sel29;
                    if (sel29) {
                      opt29 = '1';
                    } else {
                      opt29 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel29 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel29 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Transvaginal ultrasound',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel30 = !sel30;
                    if (sel30) {
                      opt30 = '1';
                    } else {
                      opt30 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel30 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel30 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Gestational sac',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel31 = !sel31;
                    if (sel31) {
                      opt31 = '1';
                    } else {
                      opt31 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel31 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel31 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Foetus',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel32 = !sel32;
                    if (sel32) {
                      opt32 = '1';
                    } else {
                      opt32 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel32 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel32 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Chocolate cyst',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel33 = !sel33;
                    if (sel33) {
                      opt33 = '1';
                    } else {
                      opt33 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel33 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel33 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Cervix',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel34 = !sel34;
                    if (sel34) {
                      opt34 = '1';
                    } else {
                      opt34 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel34 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel34 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Urinary bladder',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel35 = !sel35;
                    if (sel35) {
                      opt35 = '1';
                    } else {
                      opt35 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel35 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel35 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Polyp',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel36 = !sel36;
                    if (sel36) {
                      opt36 = '1';
                    } else {
                      opt36 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel36 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel36 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Cervical cyst',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              const Text(
                'Q3. Can you identify the organ in this image from the following',
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel37 = !sel37;
                    if (sel37) {
                      opt37 = '1';
                    } else {
                      opt37 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel37 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel37 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Adnexa',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel38 = !sel38;
                    if (sel38) {
                      opt38 = '1';
                    } else {
                      opt38 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel38 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel38 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Vagina',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel39 = !sel39;
                    if (sel39) {
                      opt39 = '1';
                    } else {
                      opt39 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel39 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel39 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Uterus',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sel40 = !sel40;
                    if (sel40) {
                      opt40 = '1';
                    } else {
                      opt40 = '0';
                    }
                    choices = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      sel40 ? Icons.check_box : Icons.check_box_outline_blank,
                      color: sel40 ? Colors.blue : Colors.black,
                    ),
                    const Text(
                      ' Ovary',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              const Text(
                'Q4. Any comment related to the image',
              ),
              TextField(
                controller: comments,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  focusColor: Colors.black,
                  hintText: 'Add comments',
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    ButtonWidget(
                      index: index,
                      iconData: Icons.arrow_back,
                      onClicked: () async {
                        int imgIndex = index;

                        //restarting and stopping the timer
                        stopTimer(resetTime: true);
                        startTimer();

                        //going back to top
                        scrollController.animateTo(
                          0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                        );

                        //initialising new values
                        setState(() {
                          if (index == 0) {
                            imgIndex = index = len - 1;
                          } else {
                            imgIndex = index--;
                          }
                          opt1 = '0';
                          opt2 = '0';
                          opt3 = '0';
                          opt4 = '0';
                          opt5 = '0';
                          opt6 = '0';
                          opt7 = '0';
                          opt8 = '0';
                          opt9 = '0';
                          opt10 = '0';
                          opt11 = '0';
                          opt12 = '0';
                          opt13 = '0';
                          opt14 = '0';
                          opt15 = '0';
                          opt16 = '0';
                          opt17 = '0';
                          opt18 = '0';
                          opt19 = '0';
                          opt20 = '0';
                          opt21 = '0';
                          opt22 = '0';
                          opt23 = '0';
                          opt24 = '0';
                          opt25 = '0';
                          opt26 = '0';
                          opt27 = '0';
                          opt28 = '0';
                          opt29 = '0';
                          opt30 = '0';
                          opt31 = '0';
                          opt32 = '0';
                          opt33 = '0';
                          opt34 = '0';
                          opt35 = '0';
                          opt36 = '0';
                          opt37 = '0';
                          opt38 = '0';
                          opt39 = '0';
                          opt40 = '0';

                          sel1 = false;
                          sel2 = false;
                          sel3 = false;
                          sel4 = false;
                          sel5 = false;
                          sel6 = false;
                          sel7 = false;
                          sel8 = false;
                          sel9 = false;
                          sel10 = false;
                          sel11 = false;
                          sel12 = false;
                          sel13 = false;
                          sel14 = false;
                          sel15 = false;
                          sel16 = false;
                          sel17 = false;
                          sel18 = false;
                          sel19 = false;
                          sel20 = false;
                          sel21 = false;
                          sel22 = false;
                          sel23 = false;
                          sel24 = false;
                          sel25 = false;
                          sel26 = false;
                          sel27 = false;
                          sel28 = false;
                          sel29 = false;
                          sel30 = false;
                          sel31 = false;
                          sel32 = false;
                          sel33 = false;
                          sel34 = false;
                          sel35 = false;
                          sel36 = false;
                          sel37 = false;
                          sel38 = false;
                          sel39 = false;
                          sel40 = false;

                          comments.text = '';
                        });
                      },
                    ),

                    //The index moves forward and the response gets stored in the excel sheet
                    ButtonWidget(
                      iconData: Icons.arrow_forward,
                      onClicked: () async {
                        Map<String, dynamic> data = {
                          DataSet.imagePath: viewImage,
                          DataSet.option1: opt1,
                          DataSet.option2: opt2,
                          DataSet.option3: opt3,
                          DataSet.option4: opt4,
                          DataSet.option5: opt5,
                          DataSet.option6: opt6,
                          DataSet.option7: opt7,
                          DataSet.option8: opt8,
                          DataSet.option9: opt9,
                          DataSet.option10: opt10,
                          DataSet.option11: opt11,
                          DataSet.option12: opt12,
                          DataSet.option13: opt13,
                          DataSet.option14: opt14,
                          DataSet.option15: opt15,
                          DataSet.option16: opt16,
                          DataSet.option17: opt17,
                          DataSet.option18: opt18,
                          DataSet.option19: opt19,
                          DataSet.option20: opt20,
                          DataSet.option21: opt21,
                          DataSet.option22: opt22,
                          DataSet.option23: opt23,
                          DataSet.option24: opt24,
                          DataSet.option25: opt25,
                          DataSet.option26: opt26,
                          DataSet.option27: opt27,
                          DataSet.option28: opt28,
                          DataSet.option29: opt29,
                          DataSet.option30: opt30,
                          DataSet.option31: opt31,
                          DataSet.option32: opt32,
                          DataSet.option33: opt33,
                          DataSet.option34: opt34,
                          DataSet.option35: opt35,
                          DataSet.option36: opt36,
                          DataSet.option37: opt37,
                          DataSet.option38: opt38,
                          DataSet.option39: opt39,
                          DataSet.option40: opt40,
                          DataSet.comment: comments.text.trim(),
                          DataSet.dateTime: DateTime.now().toString(),
                          DataSet.user: FirebaseAuth.instance.currentUser!.email
                              .toString(),
                        };
                        await DataSheetApi.insert([data]);

                        //going back to top
                        scrollController.animateTo(
                          0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                        );

                        //popup for no choice selected
                        if (choices == false && comments.text == '') {
                          Fluttertoast.showToast(
                            msg: 'No choice selected and no comment added',
                            gravity: ToastGravity.BOTTOM,
                          );
                        }

                        //saving the progress
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();

                        sp.setInt('index', index + 1);
                        print(sp.getInt('index'));

                        //storing
                        FirebaseServices().storeTime(
                            time: duration.toString(), imageIndex: index);

                        //restarting and stopping the timer
                        stopTimer(resetTime: true);
                        startTimer();

                        //initialising new values
                        setState(
                          () {
                            if (index == len - 1) {
                              index = 0;
                            } else {
                              index++;
                            }
                            opt1 = '0';
                            opt2 = '0';
                            opt3 = '0';
                            opt4 = '0';
                            opt5 = '0';
                            opt6 = '0';
                            opt7 = '0';
                            opt8 = '0';
                            opt9 = '0';
                            opt10 = '0';
                            opt11 = '0';
                            opt12 = '0';
                            opt13 = '0';
                            opt14 = '0';
                            opt15 = '0';
                            opt16 = '0';
                            opt17 = '0';
                            opt18 = '0';
                            opt19 = '0';
                            opt20 = '0';
                            opt21 = '0';
                            opt22 = '0';
                            opt23 = '0';
                            opt24 = '0';
                            opt25 = '0';
                            opt26 = '0';
                            opt27 = '0';
                            opt28 = '0';
                            opt29 = '0';
                            opt30 = '0';
                            opt31 = '0';
                            opt32 = '0';
                            opt33 = '0';
                            opt34 = '0';
                            opt35 = '0';
                            opt36 = '0';
                            opt37 = '0';
                            opt38 = '0';
                            opt39 = '0';
                            opt40 = '0';

                            sel1 = false;
                            sel2 = false;
                            sel3 = false;
                            sel4 = false;
                            sel5 = false;
                            sel6 = false;
                            sel7 = false;
                            sel8 = false;
                            sel9 = false;
                            sel10 = false;
                            sel11 = false;
                            sel12 = false;
                            sel13 = false;
                            sel14 = false;
                            sel15 = false;
                            sel16 = false;
                            sel17 = false;
                            sel18 = false;
                            sel19 = false;
                            sel20 = false;
                            sel21 = false;
                            sel22 = false;
                            sel23 = false;
                            sel24 = false;
                            sel25 = false;
                            sel26 = false;
                            sel27 = false;
                            sel28 = false;
                            sel29 = false;
                            sel30 = false;
                            sel31 = false;
                            sel32 = false;
                            sel33 = false;
                            sel34 = false;
                            sel35 = false;
                            sel36 = false;
                            sel37 = false;
                            sel38 = false;
                            sel39 = false;
                            sel40 = false;

                            comments.text = '';
                          },
                        );
                      },
                      index: index,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final min = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(3),
        ),
        Text('$min:$seconds'),
        IconButton(
          onPressed: () async {
            // Map<String, dynamic> data = {
            //   DataSet.imagePath: viewImage,
            //   DataSet.option1: opt1,
            //   DataSet.option2: opt2,
            //   DataSet.option3: opt3,
            //   DataSet.option4: opt4,
            //   DataSet.option5: opt5,
            //   DataSet.option6: opt6,
            //   DataSet.option7: opt7,
            //   DataSet.option8: opt8,
            //   DataSet.option9: opt9,
            //   DataSet.option10: opt10,
            //   DataSet.option11: opt11,
            //   DataSet.option12: opt12,
            //   DataSet.option13: opt13,
            //   DataSet.option14: opt14,
            //   DataSet.option15: opt15,
            //   DataSet.option16: opt16,
            //   DataSet.option17: opt17,
            //   DataSet.option18: opt18,
            //   DataSet.option19: opt19,
            //   DataSet.option20: opt20,
            //   DataSet.option21: opt21,
            //   DataSet.option22: opt22,
            //   DataSet.option23: opt23,
            //   DataSet.option24: opt24,
            //   DataSet.option25: opt25,
            //   DataSet.option26: opt26,
            //   DataSet.option27: opt27,
            //   DataSet.option28: opt28,
            //   DataSet.option29: opt29,
            //   DataSet.option30: opt30,
            //   DataSet.option31: opt31,
            //   DataSet.option32: opt32,
            //   DataSet.option33: opt33,
            //   DataSet.option34: opt34,
            //   DataSet.option35: opt35,
            //   DataSet.option36: opt36,
            //   DataSet.option37: opt37,
            //   DataSet.option38: opt38,
            //   DataSet.option39: opt39,
            //   DataSet.option40: opt40,
            //   DataSet.comment: comments.text.trim(),
            //   DataSet.dateTime: DateTime.now().toString(),
            //   DataSet.user: FirebaseAuth.instance.currentUser!.email.toString(),
            // };
            // await DataSheetApi.insert([data]);

            //popup for no choice selected
            if (choices == false && comments.text == '') {
              Fluttertoast.showToast(
                msg: 'No choice selected and no comment added',
                gravity: ToastGravity.BOTTOM,
              );
            }

            //saving the progress
            SharedPreferences sp = await SharedPreferences.getInstance();

            sp.setInt('index', index + 1);
            print(sp.getInt('index'));

            //storing
            FirebaseServices()
                .storeTime(time: duration.toString(), imageIndex: index);

            Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
            stopTimer(resetTime: true);
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
    );
  }
}
