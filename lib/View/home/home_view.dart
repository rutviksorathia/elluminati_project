import 'package:elluminati_project/View/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) {
        model.readJson();
      },
      builder: (context, model, _) {
        return Container(
          color: Colors.white,
          child: const Text('Rutvik'),
        );
      },
    );
  }
}
