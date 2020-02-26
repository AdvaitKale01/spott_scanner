import 'package:google_lens_clone/models/channel_message_model.dart';
import 'package:google_lens_clone/models/direct_message_model.dart';

abstract class IRepository{

  Future<List<ChannelModel>> getHomeData();

  Future<List<DirectMessageModel>> getDirectMessageData();
}