import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/chanel_list_all_cubit.dart';
import 'package:Whispers/src/cubit/chanel_list_all_state.dart';
import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/share_components/loading/loading.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:Whispers/src/utils/enum/enum_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/Chat.dart';
import '../../../share_components/button/filled_outline_button.dart';
import '../../messages/message_screen.dart';
import 'chat_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ChanelListAllCubit _chanelListAllCubit = getIt<ChanelListAllCubit>();
  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  final List<Chanel> _listChanel = [];
  late ScrollController _sc;

  @override
  void initState() {
    _initData();
    _sc = ScrollController()
      ..addListener(() {
        if (_sc.position.pixels == _sc.position.maxScrollExtent && _page < _totalPage - 1) {
          _loadMore();
        }
      });
    super.initState();
  }

  void _loadMore() {
    _chanelListAllCubit.getlistChanel(page: _page, size: _size, status: StatusChanel.sttaccepted.getString());
    _page++;
  }

  void _initData() {
    _chanelListAllCubit.getlistChanel(page: _page, size: _size, status: StatusChanel.sttaccepted.getString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          color: Palette.primary,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              const SizedBox(width: 16),
              FillOutlineButton(
                press: () {},
                text: "Active",
                isFilled: false,
              ),
            ],
          ),
        ),
        BlocListener<ChanelListAllCubit, ChanelListAllState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () => const Empty(),
              loading: (value) => const Loading(),
              success: (value) {
                _totalPage = value.listChanel?.totalPages ?? 1;
                _listChanel.addAll(value.listChanel?.content as Iterable<Chanel>);
              },
              failure: (value) => const Empty(),
            );
          },
          child: Expanded(
            child: ListView.builder(
              itemCount: _listChanel.length,
              itemBuilder: (context, index) => ChatCard(
                isStatus: true,
                chat: chatsData[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessagesScreen(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
