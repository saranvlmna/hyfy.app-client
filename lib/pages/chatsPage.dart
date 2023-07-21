import 'package:flutter/material.dart';

import '../models/messageData.dart';
import '../screens/chatScreen.dart';
import '../utilitys/theme.dart';
import '../widgets/avathar.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: const CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((_delegate)))
        ],
      ),
    );
  }
}

Widget _delegate(BuildContext context, int index) {
  return messageTitle(
      messageData: MessageData(
          senderName: 'isJith',
          message: 'hei',
          messageDate: '22/04/23',
          profilePic: 'https://sarancom.web.app/assets/img/profile-img.jpg'));
}

// ignore: camel_case_types
class messageTitle extends StatelessWidget {
  const messageTitle({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Avatar.medium(
              url: messageData.profilePic,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    messageData.senderName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        letterSpacing: 8.2,
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    messageData.message,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '22/04/23',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                        color: AppColors.textFaded),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 18,
                    height: 19,
                    decoration: const BoxDecoration(
                        color: AppColors.secondary, shape: BoxShape.circle),
                    child: const Center(
                      child: Text(
                        '1',
                        style:
                            TextStyle(fontSize: 10, color: AppColors.textLigth),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
