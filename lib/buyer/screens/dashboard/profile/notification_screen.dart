import 'package:skeletonizer/skeletonizer.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  init() {
    context.read<NotificationVm>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationVm>(builder: (context, ref, _) {
      return Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: const CustomHeader(
          title: 'Notifications',
          titleWeight: FontWeight.w500,
        ),
        body: SizedBox(
          width: Sizer.screenWidth,
          height: Sizer.screenHeight,
          child: RefreshIndicator(
            onRefresh: () async {
              ref.fetchNotifications();
            },
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              shrinkWrap: true,
              children: [
                const YBox(14),
                Builder(builder: (context) {
                  if (ref.isBusy) {
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, __) {
                        return const Skeletonizer(
                          enabled: true,
                          child: NotificationCard(
                            title: 'Welcome to Soto! 🚀',
                            subtitle:
                                'Congratulations on joining Soto, the thriving online shopping App for buying and selling! We\'re excited to have you on board. .',
                            time: 'Just now',
                          ),
                        );
                      },
                      separatorBuilder: (_, __) =>
                          const Divider(thickness: 0.5),
                      itemCount: 10,
                    );
                  }
                  if (ref.notificationList.isEmpty) {
                    return const EmptyListState(
                      height: 500,
                      text: 'No notifications found',
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgWhite,
                      borderRadius: BorderRadius.circular(Sizer.radius(14)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: Sizer.width(16),
                            right: Sizer.width(16),
                            top: Sizer.height(20),
                            bottom: Sizer.height(8),
                          ),
                          child: Text(
                            'Updates',
                            style: AppTypography.text14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.text5C,
                            ),
                          ),
                        ),
                        const Divider(
                          color: AppColors.dividerColor,
                          thickness: 0.5,
                        ),
                        ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, i) {
                            final t = ref.notificationList[i];
                            return NotificationCard(
                              title: t.title ?? '',
                              subtitle: t.content ?? '',
                              time:
                                  timeago.format(t.createdAt ?? DateTime.now()),
                              onDelete: () {
                                ref.readNotification(t.id ?? '0');
                              },
                            );
                          },
                          separatorBuilder: (_, __) =>
                              const Divider(thickness: 0.5),
                          itemCount: ref.notificationList.length,
                        ),
                        const YBox(70),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
