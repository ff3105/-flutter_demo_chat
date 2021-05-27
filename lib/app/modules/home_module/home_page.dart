import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdteam_demo_chat/app/modules/home_module/home.dart';
import 'package:pdteam_demo_chat/app/routes/app_pages.dart';
import 'package:pdteam_demo_chat/app/widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SafeArea(
        child: GetX<HomeController>(
          builder: (_) {
            return ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, i) {
                final item = controller.users[i];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.chat, arguments: {
                      'uID': item.uID,
                      'name': item.name,
                      'avatar': item.avatar,
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      leading: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.grey.shade200, width: 2)),
                            child: ClipOval(
                              child: Image.network(
                                item.avatar!,
                              ),
                            ),
                          ),
                          item.isActive
                              ? Positioned(
                                  bottom: 4,
                                  right: 4,
                                  child: Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name),
                          Text(
                            item.email,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}