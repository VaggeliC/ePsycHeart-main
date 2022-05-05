// TODO Implement this library.// ignore_for_file: prefer_const_constructors
import 'package:epsycheart/geriatric/incontinence/screens/reminders_page.dart';
import 'package:epsycheart/psychology/expressive_writing/screens/form_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/utilities/app_theme.dart';
import '../../../core/widgets/language_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../utilities/constantscolors.dart';

class ExpressiveWritingScreen extends StatefulWidget {
  const ExpressiveWritingScreen({Key? key}) : super(key: key);

  @override
  _ExpressiveWritingScreenState createState() =>
      _ExpressiveWritingScreenState();
}

class _ExpressiveWritingScreenState extends State<ExpressiveWritingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
        actions: [
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: AppTheme.black,
            iconSize: 32,
          ),
          LanguageButton()
        ],
        //  iconTheme: const IconThemeData(color: Color(0xFF17262A)),
        iconTheme: const IconThemeData(color: AppTheme.black),

        backgroundColor: AppTheme.background,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'psychology.expressiveWriting.expressiveWritingTitle',
          style: TextStyle(fontSize: 25, color: AppTheme.black),
        ).tr(),
        /*  shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),*/
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: InkWell(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  AppTheme.blue,
                                  AppTheme.blue,
                                  AppTheme.blue,
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 0.5, 1],
                                tileMode: TileMode.clamp,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                              'psychology.expressiveWriting.startWriting',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  letterSpacing: 1.0,
                                                  color: AppTheme.background,
                                                  //Color(0xFF2b8a68),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500))
                                          .tr(),
                                    ),
                                    //const SizedBox(height: 7,),/*  */
                                    Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height /
                                              9 *
                                              0.1),
                                      child: Container(
                                        height: 95,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                9,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images_incontinence/typeWriter.png"),
                                            fit: BoxFit.fitHeight,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          )),
                      onTap: () {
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ExpressiveWritingForm())));
                        }
                      }),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: InkWell(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: AppTheme.orange,
                                    offset: Offset(1.1, 4.0),
                                    blurRadius: 8.0),
                              ],
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  AppTheme.purple,
                                  AppTheme.red,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text(
                                              'psychology.expressiveWriting.reminders',
                                              style: TextStyle(
                                                  letterSpacing: 1.0,
                                                  color: AppTheme
                                                      .background, //Color(0xFFD86D30),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500))
                                          .tr(),
                                    ),
                                    //const SizedBox(height: 10,),/*  */
                                    Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height /
                                              9 *
                                              0.1),
                                      child: Container(
                                        height: 95,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                9,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images_incontinence/alert6.png"),
                                            fit: BoxFit.contain,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ReminderPage())));
                        //Navigator.pushReplacementNamed(context, '/details');
                      }),
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
            thickness: 3,
            indent: 20,
            endIndent: 20,
            color: AppTheme.black,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /* SizedBox(
                              height: size.height * 0.05,
                            ),*/
                    Text("psychology.expressiveWriting.howToStartWriting",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 25))
                        .tr(),
                    SizedBox(height: 10),
                    Text(
                      "psychology.expressiveWriting.duration",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ).tr(),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[],
                    ),
                    SizedBox(height: 10),
                    Text("psychology.expressiveWriting.instructions",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 25))
                        .tr(),
                    SizedBox(height: 10),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          height: 280,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: AppTheme.black.withOpacity(0.6),
                                  offset: const Offset(1.1, 4.0),
                                  blurRadius: 8.0),
                            ],
                            gradient: LinearGradient(
                              colors: <Color>[
                                AppTheme.white,
                                Colors.grey.shade300,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(34.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(width: 40),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("psychology.expressiveWriting.details",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(fontSize: 20))
                                        .tr()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                              color: AppTheme.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 2,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                                'assets/images_incontinence/about2.png'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customElevatedButton(
      String title, int color1, int color2, String path) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          padding: const EdgeInsets.all(0.0),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, path);
        },
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(color1), Color(color2)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppTheme.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final String txt;
  final Color color1;
  final Color color2;
  final Function() press;

  const SeassionCard({
    Key? key,
    required this.seassionNum,
    required this.txt,
    required this.color1,
    required this.color2,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: AppTheme.grey,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 62,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: isDone
                            ? LinearGradient(colors: [color1, color2])
                            : const LinearGradient(
                                colors: [AppTheme.white, AppTheme.white]),
                        color: isDone ? AppTheme.blue : AppTheme.white,
                        shape: BoxShape.circle,
                        //border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        size: 30.0,
                        color: isDone ? AppTheme.white : AppTheme.blue,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(txt, style: const TextStyle(fontSize: 20)).tr(),
                    Text(" $seassionNum", style: const TextStyle(fontSize: 20)
                        // style: Theme.of(context).textTheme.subtitle1,
                        )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
