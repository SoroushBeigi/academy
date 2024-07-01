import 'package:academy/src/core/domain/entities/tv_entity.dart';
import 'package:academy/src/features/auth/presentation/cubit/auth_cubit.dart';

class AppConstants {
  static const int onboardingPagesCount = 3;
  static const String tokenKey = 'token';
  static const String saveContentList = 'saveContentList';
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  static const String baseUrl = 'http://46.209.222.131:8080';
  static const String baseUrlWithoutPort = 'http://46.209.222.131';
  static const String loggedInKey = 'loggedIn';
  static const String imageUrl =
      'https://fastly.picsum.photos/id/1044/200/200.jpg?hmac=HB3e6tTss6J_9wexZ1v1psMlccdyQIrHrrijUgWXFhg';
  static bool isDark = false;
  static bool isFa = true;
  static const bool showApprovedOnly = true;
  static const String mobileTVUrl = 'https://live.aionet.ir';
  static const String webTVUrl = 'http://46.209.222.131:8081';
  static const String allVideosChip = 'All2';
  static const String tvChip = 'TV';
  static List<TvEntity> tvs = [
    TvEntity(
      name: 'شبکه یک',
      description: 'شبکه یک، شبکه هر ایرانی',
      url: '/hls/tv1/tv1_540/index.m3u8',
      imageUrl: '/images/1.png',
    ),
    TvEntity(
      name: 'شبکه دو',
      description: 'شبکه دو، شبکه زندگی',
      url: '/hls/tv2/tv2_540/index.m3u8',
      imageUrl: '/images/2.png',
    ),
    TvEntity(
      name: 'شبکه سه',
      description: 'شبکه سه، شبکه جوان',
      url: '/hls/tv3/tv3_540/index.m3u8',
      imageUrl: '/images/3.png',
    ),
    TvEntity(
      name: 'شبکه چهار',
      description: 'شبکه چهار، شبکه دانایی',
      url: '/hls/tv4/tv4_540/index.m3u8',
      imageUrl: '/images/4.png',
    ),
    TvEntity(
      name: 'شبکه پنج',
      description: 'شبکه پنج سیما',
      url: '/hls/tv5/tv5_540/index.m3u8',
      imageUrl: '/images/5.png',
    ),
    TvEntity(
      name: 'شبکه خبر',
      description: 'شبکه خبر، صحت، دقت، سرعت',
      url: '/hls/irinn/irinn_540/index.m3u8',
      imageUrl: '/images/irinn.png',
    ),
    TvEntity(
      name: 'شبکه آموزش',
      description: 'شبکه آموزش، آموزش ببینیم',
      url: '/hls/amoozesh/amoozesh_540/index.m3u8',
      imageUrl: '/images/amouzesh.png',
    ),
    TvEntity(
      name: 'شبکه پویا',
      description: 'شبکه پویا، دوست خوب بچه‌ها',
      url: '/hls/pooya/pooya_540/index.m3u8',
      imageUrl: '/images/pooya.png',
    ),
    TvEntity(
      name: 'شبکه نمایش',
      description: 'شبکه نمایش',
      url: '/hls/namayesh/namayesh_540/index.m3u8',
      imageUrl: '/images/namayesh.png',
    ),
    TvEntity(
      name: 'شبکه آی‌فیلم',
      description: 'شبکه آی‌فیلم، دوست خانواده من',
      url: '/hls/ifilm2/ifilm2_540/index.m3u8',
      imageUrl: '/images/ifilm.png',
    ),
    TvEntity(
      name: 'شبکه تماشا',
      description: 'شبکه تماشا، تماشا را به تماشا بنشینید',
      url: '/hls/tamasha/tamasha_540/index.m3u8',
      imageUrl: '/images/tamasha.png',
    ),
    TvEntity(
      name: 'شبکه نسیم',
      description: 'شبکه نسیم، شبکه نشاط و سرگرمی',
      url: '/hls/nasim/nasim_540/index.m3u8',
      imageUrl: '/images/nasim.png',
    ),
    TvEntity(
      name: 'شبکه ورزش',
      description: 'شبکه ورزش، جایگاهی برای همه ورزش‌ها',
      url: '/hls/varzesh/varzesh_1080/index.m3u8',
      imageUrl: '/images/varzesh.png',
    ),
    TvEntity(
      name: 'شبکه سلامت',
      description: 'شبکه سلامت، نشاط و تندرستی',
      url: '/hls/salamat/salamat_540/index.m3u8',
      imageUrl:
          '/images/salamat.png',
    ),
  ];
}
