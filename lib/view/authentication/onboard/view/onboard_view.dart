import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../view_model/onboard_view_model.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      viewModel: OnboardViewModel(),
      onBaseReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onBaseBuilder: (context, viewModel) => Scaffold(
        floatingActionButton: Observer(builder: (context) => buildFloatingActionButton(viewModel)),
        body: 
           Column(
            children: [
              Expanded(
                flex: 8,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: circleIndicator(viewModel))
            ],
          
        ),
      ),
    );
  }

  Widget buildFloatingActionButton(OnboardViewModel viewModel) {
    return viewModel.currentIndex == 3
        ? FloatingActionButton(
            onPressed: () => viewModel.complateOnboard(),
            child: Icon(Icons.navigate_next_outlined),
          )
        : Text('');
  }

  Widget buildPageView(OnboardViewModel viewModel) {
    return Observer(builder: (_) {
      return PageView.builder(
        onPageChanged: (value) => viewModel.changePageIndex(value),
        itemCount: viewModel.pageList.length,
        itemBuilder: (context, index) => Column(children: [
          Expanded(flex: 8, child: buildImage(viewModel, index)),
          Expanded(
            flex: 2,
            child: buildText(viewModel, index, context),
          ),
        ]),
      );
    });
  }

  Image buildImage(OnboardViewModel viewModel, int index) =>
      Image.asset(viewModel.pageList[index].imagePath.toPng);

  Text buildText(OnboardViewModel viewModel, int index, BuildContext context) {
    return Text(
      viewModel.pageList[index].text,
      style: context.textTheme.headline6,
    );
  }

  Widget circleIndicator(OnboardViewModel viewModel) {
    return Observer(builder: (_) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: viewModel.pageList.length,
        itemBuilder: (context, index) => Observer(
            builder: (context) => AnimatedOpacity(
                  opacity: viewModel.currentIndex == index ? 0.8 : 0.4,
                  duration: context.lowDuration,
                  child: Padding(
                    padding: context.paddingLow,
                    child: CircleAvatar(
                      radius: viewModel.currentIndex == index
                          ? context.dynamicHeight(1)
                          : context.dynamicHeight(0.5),
                    ),
                  ),
                )),
      );
    });
  }
}
