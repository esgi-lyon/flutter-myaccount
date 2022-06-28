import 'package:flutter/material.dart';
import 'package:myaccount/commons/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: AppTheme.of(context).title2,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [],
          ),
        ),
      ),
    );
  }
}
