
import 'package:google_lens_clone/enums/apiurl.dart';
import 'package:google_lens_clone/enums/enviroment.dart';

class Settings{


 static final CurrentVmsWebAPI = getApiUrl(Enviroment.Development,ApiUrl.VMSAPI);
 static final CurrentIdentityAPI = getApiUrl(Enviroment.Development,ApiUrl.IDENTITYAPI);

 //Production
 static const APIbaseUrl_production="";
 static const IDENTITYbaseUrl_production="";

//Development
 static const APIbaseUrl_development="";
 static const IDENTITYbaseUrl_development="";


 //StagingUrl
 static const APIbaseUrl_staging="";
 static const IDENTITYbaseUrl_staging="";

 //AppUnique Identifier
static const AppUniqueIdentifier = "";


static const default_username = "Raash Vision";


static String getApiUrl(Enviroment enviroment, ApiUrl whichapi) {

      String url;


       if (whichapi == ApiUrl.VMSAPI) {
            switch(enviroment) {

             case Enviroment.Development:{
              url = APIbaseUrl_development;
             }
             break;

             case Enviroment.Staging:{
              url = APIbaseUrl_staging;
             }
             break;

             case Enviroment.Production:{
              url = APIbaseUrl_production;
             }
             break;


            }

       }
       else {

            switch(enviroment) {

             case Enviroment.Development:{
              url = IDENTITYbaseUrl_development;
             }
             break;

             case Enviroment.Staging:{
              url = IDENTITYbaseUrl_staging;
             }
             break;

             case Enviroment.Production:{
              url = IDENTITYbaseUrl_production;
             }
             break;


            }
       }

       return url;
  }

}
