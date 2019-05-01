import 'package:flutter/material.dart';

enum PageType {
  primary,
  secondary,
}

class LayoutMainPage extends StatefulWidget {

  LayoutMainPage({Key key}) : super(key: key);

  @override
  _LayoutMainPageState createState() => _LayoutMainPageState();
}

class _LayoutMainPageState extends State<LayoutMainPage> {

  PageType _pageType = PageType.primary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    /// 初期値無しで定義可能っぽい？
    /// flutter: null
    /// nullが入るっぽい
    Color _pageColor;

    /// とりあえず色、追ってpageごと挿げ替える
    switch (_pageType) {
      case PageType.primary:
        _pageColor = Colors.pink;
        break;
      case PageType.secondary:
        _pageColor = Colors.amberAccent;
        break;
    };

    return Scaffold(
      backgroundColor: _pageColor,
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
      ///　↓引数書かなくてもいい感じにつないでくれるっぽい,closureちっく
      onTap: _onSelectTab,
    );
  }

  /// タブ選択
  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _onPageSelected(PageType.primary);
        break;
      case 1:
        _onPageSelected(PageType.secondary);
        break;
    };
  }

  /// ページタイプの変更
  void _onPageSelected(PageType selection) {
    /// stateの変更を行いbuildを呼び出す
    setState(() {
        _pageType = selection;
    });
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