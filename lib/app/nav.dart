import 'package:flutter/material.dart';
import 'package:myaccount/commons/constants/routes.dart';
import 'package:myaccount/commons/theme.dart';

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, required this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = Routes.home;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = Routes.tabs.keys.toList().indexOf(_currentPage);
    final routes = Routes.tabs;
    final primaryBackground = AppTheme.of(context).primaryBackground;

    print(_currentPage);
    routes.removeWhere((key, value) => key != _currentPage);

    if (routes.isEmpty) {
      routes.putIfAbsent(
          Routes.splashScreen, () => Routes.tabs[Routes.splashScreen]!);
      _currentPage = Routes.splashScreen;
    }

    return Scaffold(
      body: routes.map((key, value) =>
          MapEntry(key, Builder(builder: value).build(context)))[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) =>
            setState(() => _currentPage = Routes.tabs.keys.toList()[i]),
        backgroundColor: primaryBackground,
        selectedItemColor: AppTheme.of(context).tertiaryColor,
        unselectedItemColor: Color(0x8A000000),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home_filled,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 24,
            ),
            label: 'Profile',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.settings,
              size: 24,
            ),
            label: '',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
