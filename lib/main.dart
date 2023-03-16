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
      home: HomePage(),
    );
  }
}

// C. 画面に表示する内容！
class HomePage extends StatelessWidget {
  final _urlLaunchWithStringButton = UrlLaunchWithStringButton();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .6,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'My Profile', 
            style: TextStyle(
              color: Colors.black87,
              // fontStyle: FontStyle.italic
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
      body: BodyWidget(urlLaunchWithStringButton: _urlLaunchWithStringButton),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required UrlLaunchWithStringButton urlLaunchWithStringButton,
  }) : _urlLaunchWithStringButton = urlLaunchWithStringButton;

  final UrlLaunchWithStringButton _urlLaunchWithStringButton;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
        Column(
          children: [
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
                  fontSize: 30,
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
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                'プロフィール',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Text("早稲田大学基幹理工学部情報通信学科3年。プログラミングをしています。"),
            ),
            Center(
              child: Text(
                'I am a 3rd year student in the Department of Information and Communication, School of Fundamental Science and Engineering, Waseda University. I study Computer Science.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                'スキル',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'Skills',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(/*角の丸み*/20),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.devices,
                              size: 100,
                              color: Colors.indigo,
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(/*角の丸み*/20),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.psychology,
                              size: 100,
                              color: Colors.indigo,
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
                  ],
                  shrinkWrap: true,
                ),
              ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                '資格 実績',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'Qualifications Achievements',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
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
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(/*角の丸み*/20),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.domain,
                              size: 100,
                              color: Colors.indigo,
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(/*角の丸み*/20),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.computer,
                              size: 100,
                              color: Colors.indigo,
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
                  ],
                  shrinkWrap: true,
                ),
              ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                '制作物',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'Products',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(/*角の丸み*/20),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/thissite.png',
                              width: 100,
                              height: 100,
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(/*角の丸み*/20),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/icon_blue.jpg',
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(/*角の丸み*/20),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/ochiba.png',
                              width: 100,
                              height: 100,
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(/*角の丸み*/20),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'And more...',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ]
                        ),
                        width: 250,
                      ),
                      color: Colors.white,
                    ),
                  ],
                  shrinkWrap: true,
                ),
              ),
            ),
            Center(
              child: Text("\n"),
            ),
            Center(
              child: Text(
                '連絡先',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'Contact',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
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
                            _urlLaunchWithStringButton.launchUriWithString(
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
              child: Text(
                'SNS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'SNS',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
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
                      _urlLaunchWithStringButton.launchUriWithString(
                        context,
                        "https://twitter.com/hayaoki_haya",
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
                      _urlLaunchWithStringButton.launchUriWithString(
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
                      _urlLaunchWithStringButton.launchUriWithString(
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
          ],
        ),
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