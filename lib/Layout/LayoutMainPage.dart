import 'package:flutter/material.dart';


class LayoutMainPage extends StatefulWidget {

  LayoutMainPage({Key key}) : super(key: key);

  @override
  _LayoutMainPageState createState() => _LayoutMainPageState();
}

class _LayoutMainPageState extends State<LayoutMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      appBar: AppBar(
        // この辺の改行とインデントの一般解がちょっとわからん
        leading: IconButton(icon: ColorIcon.pink(Icons.star),
            onPressed: null
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      // 2種類ある? shifting fixed
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavigationBarItem(),
          _buildBottomNavigationBarItem(),
          _buildBottomNavigationBarItem(),
          _buildBottomNavigationBarItem(),
          _buildBottomNavigationBarItem()
        ],
      onTap: null,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: ColorIcon.pink(Icons.list),
      title: Text(
        'Naaan',
        style: TextStyle(
          color: Colors.cyan,
        ),
      ),
    );
  }
}


/*
* Iconのサブクラス定義
*/
class ColorIcon extends Icon {

  /*
  * 名前付きコンストラクタ
  * Class名.Hogeで作れる
  *
  * " : super "に関しては勉強中。
  * https://dev.classmethod.jp/client-side/about_dart_constructors/
  */
  ColorIcon.pink(IconData iconData) : super(
      iconData,
      color: Colors.pink
  );
}