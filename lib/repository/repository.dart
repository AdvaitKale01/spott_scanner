import 'package:google_lens_clone/interfaces/i_mockdata.dart';
import 'package:google_lens_clone/interfaces/i_repository.dart';
import 'package:google_lens_clone/locator.dart';
import 'package:google_lens_clone/models/channel_message_model.dart';
import 'package:google_lens_clone/models/direct_message_model.dart';

class Repository implements IRepository{

    IMockData iMockData = locator<IMockData>();

  @override
  Future<List<ChannelModel>> getHomeData() {
   
    return iMockData.getHomeDrawerListData();
  }

  @override
  Future<List<DirectMessageModel>> getDirectMessageData() async{
    
    return iMockData.getDirectMessageListData();
  }




}

