App.web_notifications = App.cable.subscriptions.create("WebNotificationsChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
     event.preventDefault();
    return $('#messages').append(data['message'] + "<br>");
  }
});