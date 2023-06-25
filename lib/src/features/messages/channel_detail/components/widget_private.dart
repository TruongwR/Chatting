part of './body.dart';

Widget _bodyPrivate() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Tùy chỉnh',
        style: AppFont.t.w500,
      ),
      BoxMain.h(16),
      columnLayout(
        type: 2,
        onTap: () {},
        title: 'Chủ đề',
      ),
      columnLayout(
        type: 2,
        onTap: () {},
        title: 'Cảm xúc nhanh',
        icon: Icons.mood,
      ),
      columnLayout(
        type: 2,
        onTap: () {},
        title: 'Biệt danh',
      ),
      BoxMain.h(16),
      Text(
        'Thông tin đoạn chat',
        style: AppFont.t.w500,
      ),
      BoxMain.h(16),
      columnLayout(
        onTap: () {},
        title: 'Xem file & liên kết',
        icon: Icons.insert_photo_rounded,
      ),
      columnLayout(
        onTap: () {},
        title: 'Tìm kiếm trong cuộc trò chuyện',
        icon: Icons.search,
      ),
      columnLayout(
        onTap: () {},
        title: 'Tạo nhóm chat với Tân',
        icon: Icons.groups,
      ),
    ],
  );
}