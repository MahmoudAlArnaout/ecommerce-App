import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
class Push{

  static Future<String> getAccessToken() async{

    final serviceAccountJson={
        "type": "service_account",
        "project_id": "ecommerce-761cf",
        "private_key_id": "559dc2cb69314604f0f6a4d487f24be5d75be68d",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQDfio+YAXIdmTK3\npNvh1OzKsypbbuJbldKImqqfdKzd/C9lm7oHGQl+QDh4VGNjidfKyMKpmPWmabhQ\nlVtI4tuamea9uy7ZAiYJBnhmG5C9sylyq7l2wCOPRrUgmig1JFpm/8gXbcIdEKDs\nAzyxBOdX01Fi3GfD8VQzCKxk4gS/rDRDnaeWk6WjSqVs4yWvjDMn6i86M2v2VRj6\n7FxBlioK/B3d+zyMUPZWsOwrWOL2qKQCg6QXMHNrzgCGr0fgAJO1Iv+PIoiY9VND\nu9nGx82LRnpe0+c1AZk0lgUkC9+MtB9ixsWrifswWO8kHy/V+Awraw9KTxNhB09b\nDju1Kx0VAgMBAAECgf9r1uxu6EOlA8Lz1RQ+Xfndz5Efit6oUB7Ax9yIEEFU1dQH\nsJiN1AZAYbrcUdmgq17u9Orz5labcWT5exQOlWJbsuMdpK91ARRYRkbO+31YBpZ4\nO1+9afO9qt62W6gJ+v+hsMNWihya6Oq48NbWjwcL12Xry2hDnqh/9i80e9TOod1V\nwLITPXtwFBi1w9kWOp14U0Uo7F6xjColtZKBYY9t5MTJUiPt+T3m/ZIhdOJMp8Wu\nu66Wuy+O1QJYJlcK76iwTByUVuxX9lSCsNLW7VJC2u0qjzlJbjJweHr3nrf/bxC7\nch7gWFLRNk0KK8a5ufW/yYYsdowdpKUkN2tqGvsCgYEA/l+zbmDhMuK8rovxw3OW\nAFUxMUNETU7Vg+egCFhcfoV5U12BKbSVIBDTOeMeFeLRS86+7aY++iSMNgUHICRf\nobVOJJtT4KdPQ1h1nMQvgNPGrJkkQL9XGfOV4nbG3UuOB1JY7F8LXMEIwUYnPKTs\nEIQcKTmz3DzRibsXucRc3EsCgYEA4PhmiFX1sqRx6M6S8psnh2YFMMfksZYM1O4/\nb3MrBhWr1pDfy9iIskE9GrYJBY0F1fJ2OWbCQ9IaRHC+kx+XMwlABbOmOr0HII78\n/sLaTFOip2EuUtOpfnzEMEd9oJXSAv3ACE6jhDAERjgyXzIT4926HyZl5iLHXm12\n5jQfUB8CgYEAiwnoW9bcgSHqHEYmGb1eKkRmpRStiswibPz4Pld+BzIRxP2BEjjA\nokxQCH4Z/cCCwjr5pZCPL882THinEmyPUSZ21g+I42zQKHF7p/qcNICNQd5bMIDl\nrSu1q5lczaz0rw/Vxy2UWliw3mPoIn/LAKQVeHsv0pvztKLtLv8j+s0CgYAIXLNS\n9f7/+OTTBnqn0eSSP9SJj6SMhUtMzt5Ewj8jJsMQYqou5YmPNqWSzJlhP3CsFysV\nzyABbVnUmWw8A7yXBQ0AKUFQhZ4yM55rycpbc/Bj0FTsdzmhnfmc4ctloKwBuHTe\n2i1xyGcgRQ56Q15B5gf5CHBZMYm/lMoKnH1deQKBgAzrOXYyegdaV/2mb0nv7e31\n2zk21iEuPGPy5OWt2WLQwgvXCKRIuU8iFpMGayHlnpo6Yn75VmV0GAmsWWVynOpr\nFZ2Cz/SNDZyrR+WakVgJb+Bsnpvg7j45vxsplSa2guz/mIvES6N2dJiQMASD/HIg\nno5xjBreA/pesVnWABsn\n-----END PRIVATE KEY-----\n",
        "client_email": "ecommerce@ecommerce-761cf.iam.gserviceaccount.com",
        "client_id": "104865618331067936795",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ecommerce%40ecommerce-761cf.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"

    };
    List<String> scopes=[
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"

    ];

    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

    auth.AccessCredentials credentials =
    await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );
    client.close();
    return credentials.accessToken.data;
  }

  static sendNotification(
      String deviceToken,
      BuildContext context,
      String tripId,
      String messageSender,
      String messageBody,
      )
  async {
    final String serverAccessTokenKey = await getAccessToken();
    String endPointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/ecommerce-761cf/messages:send';

    final Map<String, dynamic> message = {

      'message': {
        'token': deviceToken,
        'notification': {
          'title': messageSender,
          'body': messageBody},
        'data': {
          'tripId': tripId,
        }
      }
    };

    final http.Response response =
    await http.post(Uri.parse(endPointFirebaseCloudMessaging),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $serverAccessTokenKey'
        },
        body: jsonEncode(message));

    if (response.statusCode == 200) {
      print('Notification send successfully');
    }
    else {
      print('Send notification faild: ${response.statusCode}');
    }

}






}