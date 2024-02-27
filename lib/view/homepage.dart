import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/nav_bar.dart';
import 'package:flutter_folio/common_widgets/responsive_widget.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/view/desktop_homepage.dart';
import 'package:flutter_folio/view/mobile_homepage.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../common_widgets/footer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
      homeViewModel.fetchAboutMe(context);
      homeViewModel.fetchExperience(context);
      homeViewModel.fetchMyProjects(context);
      homeViewModel.fetchMyPackages(context);
      homeViewModel.fetchMySkills(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: customAppBar(context),
      endDrawer: customDrawer(context),
      body: const ResponsiveWidget(
        mobile: MobileHomePage(),
        tablet: DesktopHomePage(),
        desktop: DesktopHomePage(),
      ),
      bottomNavigationBar: const FooterWidget(),
    );
  }
}
