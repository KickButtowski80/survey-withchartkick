

App.web_notifications = App.cable.subscriptions.create("WebNotificationsChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
 
       var chart = Chartkick.charts["chart-1"];
       
       var chartKickData = chart.getData();

       var found = false;
       
       for (var i=0; i<chartKickData.length; i++) {
         if (chartKickData[i][0] == data['message']) {
           chartKickData[i][1]++
           found = true;
         }
       }
      
       if (!found) {
         chartKickData.push([data['message'], 1]);
       }
       
       chart.updateData(chartKickData);
       // [Array(2), Array(2)]
       
       // {"Do you have a bus?"=>1, "Do you have a car?"=>1} 
       // => New Incoming WS Stream ==> data['message'] = 'Do you have a bus?'
       
       return $('#messages').append(
           "<div>" +           
            data['message'] +
           "</div>");
  }
});