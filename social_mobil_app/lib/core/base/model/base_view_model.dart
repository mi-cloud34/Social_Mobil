import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/navigation/navigation_service.dart';
import '../../init/cache/locale_storage_manager.dart';
import '../../init/network/vexana_manager.dart';

mixin BaseViewModel {
 // late BuildContext context;
  void setContext(BuildContext contextt){}
  void init(){}
   VexanaManager? vexanaManager = VexanaManager.instance;

  //ICoreDio? coreDio=NetworkManager.instance!.coreDio;
   LocaleManager localeManager = LocaleManager.instance;
    NavigationService navigation = NavigationService.instance;

  
}