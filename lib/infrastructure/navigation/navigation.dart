import 'package:auth/infrastructure/navigation/routes.dart';
import 'package:auth/presentation/author_post/author_binding.dart';
import 'package:auth/presentation/author_post/author_page.dart';
import 'package:auth/presentation/post_detail/post_detail_binding.dart';
import 'package:auth/presentation/post_detail/post_detail_page.dart';
import 'package:get/get.dart';


class Nav {
  static List<GetPage> routes = [

    GetPage(
      name: Routes.postDetail,
      page: () => PostDetailPage(),
      binding: PostDetailBinding(),
    ),
    GetPage(
      name: Routes.authorPost,
      page: () => AuthorPage(),
      binding: AuthorBinding(),
    ),
  ];
}
