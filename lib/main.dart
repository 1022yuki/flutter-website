import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// A. メイン関数
// ここからプログラムが始まる
void main() {
  runApp(
    PortfolioApp(),
  );
}

// B. アプリ全体に関する設定
class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yuki-abe',
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      home: HomePage(),
    );
  }
}

// C. 画面に表示する内容！
class HomePage extends StatelessWidget {
  final _urlLaunchWithStringButton = UrlLaunchWithStringButton();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: .6,
          title: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return HomePage();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      final Offset begin = Offset(0.0, 0.0); // 下から上
                      // final Offset begin = Offset(0.0, -1.0); // 上から下
                      final Offset end = Offset.zero;
                      final Animatable<Offset> tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: Curves.easeInOut));
                      final Animation<Offset> offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(
                'My Profile', 
                style: TextStyle(
                  color: Colors.white,
                  // fontStyle: FontStyle.italic
                ),
              ),
            ),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     color: Colors.black87,
          //     onPressed: (){},
          //   ),
          // ],
        ),
      ), 
      body: BodyWidget(urlLaunchWithStringButton: _urlLaunchWithStringButton),
    );
  }
}

class BodyWidget extends StatefulWidget {
  BodyWidget({
    super.key,
    required UrlLaunchWithStringButton urlLaunchWithStringButton,
  }) : _urlLaunchWithStringButton = urlLaunchWithStringButton;

  final UrlLaunchWithStringButton _urlLaunchWithStringButton;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
  double? _deviceWidth;
}

class _BodyWidgetState extends State<BodyWidget> {
  double? _deviceWidth;
  late bool isWide;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    if (_deviceWidth! > 600){
      isWide = true;
    } else {
      isWide = false;
    }
    return SingleChildScrollView(
      child: 
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-60,
              width: double.infinity,
              alignment: Alignment.center,
              // decoration: BoxDecoration(color: Colors.brown), // 追加
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/kane_ss.png'),
                  fit: BoxFit.cover,
              )),
              child: Text(
                'Welcome to my Website!!',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/img/watasi.jpg',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Center(
              child: Text(
                'Yuki Abe',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Text('大学生エンジニア'),
            ),
            Center(
              child: Text(
                'University student, Engineer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal:50),
                child: Text(
                  '　早稲田大学基幹理工学部情報通信学科3年。プログラミングをしています。趣味は旅行、バスケットボール、競技プログラミングです。特に関心のある分野はアプリ開発、データサイエンスです。これらの勉強を通じて革新的なサービスを開発し人々の生活を豊かにしたいと考えています。さまざまなことに積極的に挑戦したいです。',
                  style: TextStyle(
                  fontSize: 16,
                  // color: Colors.grey,
                ),
                ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal:50),
                child: Text(
                "　I am a 3rd year student in the Department of Information and Communication, School of Fundamental Science and Engineering, Waseda University. I study Computer Science. My hobbies are traveling, basketball, and competitive programming. My particular areas of interest are app development and data science. Through these studies, I hope to develop innovative services and enrich people's lives. I want to actively challenge myself in a variety of things.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 150, 145, 145),
                ),
              ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                'Skills',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: isWide? SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardDevWidget(),
                    CardMlWidget(),
                  ],
                  shrinkWrap: true,
                ),
              ):
              Column(
                  children: [
                    SizedBox(height: 10),
                    CardDevWidget(),
                    SizedBox(height: 10),
                    CardMlWidget(),
                  ],
                ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                'Achievements',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: isWide? SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardInternWidget(),
                    CardAtCoderWidget(),
                  ],
                  shrinkWrap: true,
                ),
              ):
              Column(
                children: [
                  SizedBox(height: 10),
                  CardInternWidget(),
                  SizedBox(height: 10),
                  CardAtCoderWidget(),
                ],
              ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                'Products',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: isWide? SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardMyProfileWidget(),
                    CardKudosWidget(),
                    CardOchibaWidget(),
                  ],
                  shrinkWrap: true,
                ),
              ): 
              Column(
                children: [
                  SizedBox(height: 10,),
                  CardMyProfileWidget(),
                  SizedBox(height: 10,),
                  CardKudosWidget(),
                  SizedBox(height: 10,),
                  CardOchibaWidget(),
                ],
              ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                'Contact',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "E-mail: ",
                      style: TextStyle(color: Colors.black)
                    ),
                    TextSpan(
                      text: "bntsm1022@gmail.com",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            widget._urlLaunchWithStringButton.launchUriWithString(
                              context,
                              "mailto:bntsm1022@gmail.com",
                            );
                          },
                    ),
                  ]
                )
              )
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                'SNS',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  child: MaterialButton(
                    padding: EdgeInsets.all(8.0),
                    // textColor: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/twitter.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget._urlLaunchWithStringButton.launchUriWithString(
                        context,
                        "https://twitter.com/kabekun_",
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: MaterialButton(
                    padding: EdgeInsets.all(8.0),
                    // textColor: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/github.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget._urlLaunchWithStringButton.launchUriWithString(
                        context,
                        "https://github.com/1022yuki",
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: MaterialButton(
                    padding: EdgeInsets.all(8.0),
                    // textColor: Colors.black,
                    elevation: 8.0,
                    child: Container(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/wantedly.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget._urlLaunchWithStringButton.launchUriWithString(
                        context,
                        "https://www.wantedly.com/id/kabekun",
                      );
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Text("\n"),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                "Copyright © 2023- Yuki Abe. All Rights Reserved.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
    );
  }
}

class CardMlWidget extends StatelessWidget {
  const CardMlWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(/*角の丸み*/20),
        ),
        elevation: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                child: Icon(
                  Icons.psychology,
                  size: 100,
                  color: Colors.white,
                ),
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Colors.purple,
                      Colors.deepPurple,
                    ],
                    stops: const [
                      0.0,
                      1.0,
                    ],
                  ).createShader(rect);
                },
              ),
              Text("機械学習"),
              Text(
                'Machine Learning',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ]
          ),
          width: 250,
        ),
        color: Colors.white,
      ),
    );
  }
}

class CardDevWidget extends StatelessWidget {
  const CardDevWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(/*角の丸み*/20),
        ),
        elevation: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                child: Icon(
                  Icons.devices,
                  size: 100,
                  color: Colors.white,
                ),
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Colors.purple,
                      Colors.deepPurple,
                    ],
                    stops: const [
                      0.0,
                      1.0,
                    ],
                  ).createShader(rect);
                },
              ),
              Text("アプリ開発(Django, FastAPI, Flutter)"),
              Text(
                'Development of Applications',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ]
          ),
          width: 250,
        ),
        color: Colors.white,
      ),
    );
  }
}

class CardOchibaWidget extends StatelessWidget {
  const CardOchibaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(/*角の丸み*/20),
        ),
        elevation: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/pc_ochiba.png',
                width: 120,
                height: 120,
              ),
              Text("Ochiba"),
              Text(
                'チーム開発(3人)',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              Text(
                'ブックマークを投稿し共有するWebアプリ',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              Text(
                '停止中',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                ),
              ),
            ]
          ),
          width: 250,
        ),
        color: Colors.white,
      ),
    );
  }
}

class CardKudosWidget extends StatelessWidget {
  const CardKudosWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(/*角の丸み*/20),
        ),
        elevation: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/sp_kudos.png',
                width: 100,
                height: 100,
              ),
              Text("Kudos"),
              Text(
                '個人開発',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              Text(
                'アメリカ、カナダのZ世代で爆発的に流行しているネイティブアプリGasの日本語版を開発中',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              Text(
                '開発中(Coming soon)',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.orange,
                ),
              ),
            ]
          ),
          width: 250,
        ),
        color: Colors.white,
      ),
    );
  }
}

class CardMyProfileWidget extends StatelessWidget {
  const CardMyProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(/*角の丸み*/20),
        ),
        elevation: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/pc_prof_site.png',
                width: 120,
                height: 120,
              ),
              Text("My Profile"),
              Text(
                '個人開発',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              Text(
                '自分について知ってもらうためのwebサイト(本サイト)',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              Text(
                '公開中',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.green,
                ),
              ),
            ]
          ),
          width: 250,
        ),
        color: Colors.white,
      ),
    );
  }
}

class CardAtCoderWidget extends StatelessWidget {
  const CardAtCoderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(/*角の丸み*/20),
        ),
        elevation: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                child: Icon(
                  Icons.computer,
                  size: 100,
                  color: Colors.white,
                ),
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Colors.purple,
                      Colors.deepPurple,
                    ],
                    stops: const [
                      0.0,
                      1.0,
                    ],
                  ).createShader(rect);
                },
              ),
              Text("AtCoder緑"),
              Text(
                'AtCoder rating of 800 or higher',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ]
          ),
          width: 250,
        ),
      ),
    );
  }
}

class CardInternWidget extends StatelessWidget {
  const CardInternWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(/*角の丸み*/20),
        ),
        elevation: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                child: Icon(
                  Icons.domain,
                  size: 100,
                  color: Colors.white,
                ),
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Colors.purple,
                      Colors.deepPurple,
                    ],
                    stops: const [
                      0.0,
                      1.0,
                    ],
                  ).createShader(rect);
                },
              ),
              Text("インターン(2022年8月~)"),
              Text(
                'Working as a data scientist',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ]
          ),
          width: 250,
        ),
        color: Colors.white,
      ),
    );
  }
}

class CardFeWidget extends StatelessWidget {
  const CardFeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(/*角の丸み*/20),
      ),
      elevation: 2,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school,
              size: 100,
              color: Colors.indigo,
            ),
            Text("基本情報技術者"),
            Text(
              'Fundamental Information Technology Engineer Examination',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ]
        ),
        width: 250,
      ),
      color: Colors.white,
    );
  }
}

class UrlLaunchWithStringButton {
  final alertSnackBar = SnackBar(
    content: const Text('このURLは開けませんでした'),
    action: SnackBarAction(
      label: '戻る',
      onPressed: () {},
    ),
  );

  Future launchUriWithString(BuildContext context, String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      alertSnackBar;
      ScaffoldMessenger.of(context).showSnackBar(alertSnackBar);
    }
  }
}

class ImageCard extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const ImageCard({
    Key? key,
    required this.imagePath,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,

      child: Card(
        color: Colors.white,
        elevation: 4,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: child,
            ),
          ],
        ),
      )
    );
  }
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;