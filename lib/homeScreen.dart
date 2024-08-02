import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/setting/setting_tab.dart';
import 'package:islami/tabs/setting/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class HomeScreen extends StatefulWidget {
static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    quranTab(),
    hadethtab(),
    SebhaTab(),
    radioTab(),
    settingTab(),
  ];


  @override
  Widget build(BuildContext context) {
    Settingsprovider settingsprovider =  Provider.of<Settingsprovider>(context);

    return Container(
        decoration:
        BoxDecoration(
            image: DecorationImage(
        image:AssetImage(settingsprovider.themeMode== ThemeMode.light?'images/default_bg.png' :
        'images/dark_bg.png'),
            fit: BoxFit.fill)
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index){
              currentIndex = index;
              setState(() {

              }
              );
            },

            items: [BottomNavigationBarItem
            (icon: ImageIcon(
            AssetImage('images/icon_quran.png'),
          ),
            label:AppLocalizations.of(context)!.quran,
          ),
            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('images/icon_hadeth.png'),
            ),
              label:AppLocalizations.of(context)!.hadeth,
            ),
            BottomNavigationBarItem
              (icon: ImageIcon(
              AssetImage('images/icon_sebha.png'),
            ),
              label: AppLocalizations.of(context)!.sebha,
            ),
            BottomNavigationBarItem
              (icon: ImageIcon(
              AssetImage('images/icon_radio.png'),
            ),
              label:AppLocalizations.of(context)!.radio,
            ),
            BottomNavigationBarItem
              (icon:Icon (Icons.settings_outlined),
              label: AppLocalizations.of(context)!.settings
            ),
          ],
            ),

        ),
    );
  }
}
