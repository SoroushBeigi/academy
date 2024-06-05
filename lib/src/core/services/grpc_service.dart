import 'package:grpc/grpc.dart';
import 'lib/protos/course.pbgrpc.dart';

class GrpcService {
  ///here enter your host without the http part (e.g enter google.com now http://google.com)
  String baseUrl = "example.com";

  GrpcService._internal();

  static final GrpcService _instance = GrpcService._internal();

  factory GrpcService() => _instance;

  static GrpcService get instance => _instance;
  late GetCoursesServiceClient _getCoursesServiceClient;
  late final ClientChannel channel;

  Future<void> init() async {
    _createChannel();
  }

  GetCoursesServiceClient get coursesClient {
    return _getCoursesServiceClient;
  }

  _createChannel() {
    channel = ClientChannel(
      baseUrl,

      ///port: 9043,
      port: 443,

      ///use credentials: ChannelCredentials.insecure() if you want to connect without Tls
      //options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      ///use this if you are connecting with Tls
      options: const ChannelOptions(),
    );
    _getCoursesServiceClient = GetCoursesServiceClient(channel);
  }

  closeChannel() async {
    await channel.shutdown();
  }
}
