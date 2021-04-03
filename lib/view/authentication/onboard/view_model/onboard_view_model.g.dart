// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardViewModel on _OnboardViewModelBase, Store {
  final _$pageListAtom = Atom(name: '_OnboardViewModelBase.pageList');

  @override
  List<OnboardModel> get pageList {
    _$pageListAtom.reportRead();
    return super.pageList;
  }

  @override
  set pageList(List<OnboardModel> value) {
    _$pageListAtom.reportWrite(value, super.pageList, () {
      super.pageList = value;
    });
  }

  final _$currentIndexAtom = Atom(name: '_OnboardViewModelBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_OnboardViewModelBaseActionController =
      ActionController(name: '_OnboardViewModelBase');

  @override
  void changePageIndex(int value) {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.changePageIndex');
    try {
      return super.changePageIndex(value);
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageList: ${pageList},
currentIndex: ${currentIndex}
    ''';
  }
}
