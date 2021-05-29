import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../core/constants/base_view_constants.dart';

class BaseView extends StatefulWidget {
  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  var _selectedTab = SelectedTab.home;

  late PageController pageController;

  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildPageViewBody(),
        bottomNavigationBar: DotNavigationBar(
          currentIndex: SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          selectedItemColor: Color(0xff1C1E3D),
          unselectedItemColor: Colors.blueGrey,
          items: BaseViewConstants.instance.navigationBarItems,
        ));
  }

  Widget buildPageViewBody() {
    return PageView(
      controller: pageController,
      onPageChanged: (int index) {
        setState(() {
          selectedIndex = index;
          _handleIndexChanged(index);
        });
      },
      children: BaseViewConstants.instance.allPage,
    );
  }

  void _handleIndexChanged(int i) {
    setState(() {
      pageController.jumpToPage(i);
      _selectedTab = SelectedTab.values[i];
    });
  }
}
