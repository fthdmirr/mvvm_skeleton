import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/base_view_model.dart';
import '../../../../core/constants/enum/preferences_keys.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/cache/shared_pref_manager.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../model/onboard_model.dart';

part 'onboard_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _getList();
  }

  @observable
  List<OnboardModel> pageList = [];

  @observable
  int currentIndex = 0;

  @action
  void changePageIndex(int value) => currentIndex = value;

  Future<void> _getList() async {
    await DataManager.instance.setBoolValue(PreferencesKeys.FIRST_OPEN, true);
    pageList.add(OnboardModel('Selam', 'test'));
    pageList.add(OnboardModel('Naber', 'test'));
    pageList.add(OnboardModel('İyi', 'test'));
    pageList.add(OnboardModel('TMM', 'test'));
  }

  Future<void> complateOnboard() async {
    await NavigationManager.instance
        .navigateToPageClear(path: NavigationConstants.TEST_VIEW);

    await DataManager.instance.setBoolValue(PreferencesKeys.FIRST_OPEN, false);
  }
}
