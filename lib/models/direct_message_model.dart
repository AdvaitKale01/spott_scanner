class DirectMessageModel {
   String id;
   String user_photo_url;
   String user_name;
   String recent_message;
   DateTime recent_message_time;
   String recent_message_timeago;
   bool isselected;
   bool isOnline;
   bool isSleepTIme;
  

  DirectMessageModel(this.id,this.user_photo_url, this.user_name,this.recent_message
  ,this.recent_message_time,this.isselected,this.isOnline,this.isSleepTIme);
}
