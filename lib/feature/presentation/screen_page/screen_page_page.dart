import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen_page_logic.dart';

class ScreenPagePage extends StatelessWidget {
  static const String namePath = '/home';
  final logic = Get.find<ScreenPageLogic>();
  final state = Get.find<ScreenPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ScreenPageLogic>(
        builder: (logic) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: Text('Data Save to Local ${state.dataSaveToLocal}'),
                elevation: 2,
              ),
              body: ListView.builder(
                itemCount: state.dataList.length,
                itemBuilder: (context, index) {
                  bool isDataSaved = index < state.dataSaveToLocal;
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isDataSaved ? Colors.green : Colors.grey[300]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.dataList[index].title ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
