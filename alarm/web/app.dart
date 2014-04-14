import 'dart:html';
import 'dart:js';

main() {
  DateTime now = new DateTime.now();
  DateTime myAlarmDate = now.add(new Duration(seconds: 5));

  // Creating some data
  var data = new JsObject.jsify({"msg":"Wake up!"});

  // Creating the alarm
  var myAlarm = context["navigator"]["mozAlarms"].callMethod('add',
    [myAlarmDate, "ignoreTimezone", data]);

  // What if alarm is successfully created
  myAlarm["onsuccess"] = (_) {
    print("Alarm successfully set");
  };

  // What if not :/
  myAlarm["onerror"] = (_) {
    print("Something went terribly wrong trying to set the alarm!");
  };

  // Handling the alarm
  context["navigator"].callMethod('mozSetMessageHandler', ["alarm", callback]);

}

void callback(myAlarm) => querySelector('#text').text = myAlarm["data"]["msg"];