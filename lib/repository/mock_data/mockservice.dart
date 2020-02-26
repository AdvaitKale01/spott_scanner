import 'package:flutter/material.dart';
import 'package:google_lens_clone/interfaces/i_mockdata.dart';
import 'package:google_lens_clone/models/channel_message_model.dart';
import 'package:google_lens_clone/models/direct_message_model.dart';
import 'package:uuid/uuid.dart';

class MockService implements IMockData{



  @override
  Future<List<ChannelModel>> getHomeDrawerListData() async{
 
       var uuid = new Uuid();
      List<ChannelModel> _listchannel = new List<ChannelModel>();

       //Shared channel
       _listchannel.add(new ChannelModel(uuid.v1(),"S2","facebook",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"S2","instagram",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"S2","whatapp",false));

        //CHANNELS
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","flutter",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","react-native",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","angular",false));
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","xamarin-form",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","react",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","asp.net",false));
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","python",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","django",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","flask",false));
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","xamarin-form",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","react",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"C3","asp.net",false));

        //DIRECT MESSAGE
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","ironman",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","black-panther",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","captain-america",false));
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","captain-marvel",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","black-widow",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","spiderman",false));
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","nick-fury",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","thanos",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","ironman",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","black-panther",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","captain-america",false));
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","captain-marvel",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","black-widow",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","spiderman",false));
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","nick-fury",false));   
       _listchannel.add(new ChannelModel(uuid.v1(),"DM4","thanos",false)); 

    return _listchannel;
  }

  @override
  Future<List<DirectMessageModel>> getDirectMessageListData() async {

       var uuid = new Uuid();
      List<DirectMessageModel> _listchannel = new List<DirectMessageModel>();


        //CHANNELS
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://i.ytimg.com/vi/_anDMGmck-k/maxresdefault.jpg","IronMan","I am Ironman",DateTime.now().subtract(Duration( hours: 2, minutes: 41, seconds: 56)),false,true,true));   
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/d/d7/CapAmerica-EndgameProfile.jpg","Captain America","I can do thse all the time",DateTime.now().subtract(Duration(days: 5, hours: 4, minutes: 41, seconds: 56)),false,true,false)); 
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/1/13/Thor-EndgameProfile.jpg","Thor The God Thunder","You: [You should go for the head]",DateTime.now().subtract(Duration(days: 7, hours: 2, minutes: 41, seconds: 56)),false,false,false));   
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://i2-prod.mirror.co.uk/incoming/article16339791.ece/ALTERNATES/s615/0_black-widow.jpg","Black Widow","Its ok",DateTime.now().subtract(Duration(days: 20, minutes: 41, seconds: 56)),false,true,true)); 
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://i.kinja-img.com/gawker-media/image/upload/s--QdQAoZRc--/c_scale,f_auto,fl_progressive,q_80,w_800/rmfjumf7kbujbz9uz5pm.jpg","Spiderman","We Won Mr Stark",DateTime.now().subtract(Duration(days: 8, hours: 2, minutes: 41, seconds: 56)),false,false,false));   
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://i.guim.co.uk/img/media/fdc660936c71a95ee49a4f00ed15368f3c1b4e3f/0_60_744_446/master/744.jpg","Captain Marvel","I can do thse all the time",DateTime.now().subtract(Duration(days: 2, hours: 2, minutes: 41, seconds: 56)),false,true,false)); 
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://www.sideshow.com/storage/product-images/903429/thanos_marvel_feature.jpg","Thanos","I am inviteble",DateTime.now().subtract(Duration(days: 30, hours: 2, minutes: 41, seconds: 56)),false,false,false));   
      _listchannel.add(new DirectMessageModel(uuid.v1(),"https://i.ytimg.com/vi/_anDMGmck-k/maxresdefault.jpg","IronMan","I am Ironman",DateTime.now(),false,true,true));   
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/d/d7/CapAmerica-EndgameProfile.jpg","Captain America","I can do thse all the time",DateTime.now().subtract(Duration(days: 50, minutes: 41, seconds: 56)),false,true,true)); 
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/1/13/Thor-EndgameProfile.jpg","Thor The God Thunder","You: [You should go for the head]",DateTime.now().subtract(Duration(days: 70, minutes: 41, seconds: 56)),false,true,false));   
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://i2-prod.mirror.co.uk/incoming/article16339791.ece/ALTERNATES/s615/0_black-widow.jpg","Black Widow","Its ok",DateTime.now(),false,true,false)); 
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://i.kinja-img.com/gawker-media/image/upload/s--QdQAoZRc--/c_scale,f_auto,fl_progressive,q_80,w_800/rmfjumf7kbujbz9uz5pm.jpg","Spiderman","We Won Mr Stark",DateTime.now().subtract(Duration(days: 71, minutes: 41, seconds: 56)),false,true,false));   
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://i.guim.co.uk/img/media/fdc660936c71a95ee49a4f00ed15368f3c1b4e3f/0_60_744_446/master/744.jpg","Captain Marvel","I can do thse all the time",DateTime.now().subtract(Duration(days: 80, minutes: 41, seconds: 56)),false,true,false)); 
       _listchannel.add(new DirectMessageModel(uuid.v1(),"https://www.sideshow.com/storage/product-images/903429/thanos_marvel_feature.jpg","Thanos","I am inviteble",DateTime.now(),false,false,true));   
      

    return _listchannel;
  }





}