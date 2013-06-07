$(document).ready(function(){

  var ws = new WebSocket("ws://127.0.0.1:8080");

  ws.onmessage = function(e) {
    putMessage(e.data);
  };

  ws.onclose = function() {
    console.log("Socket closed");
  };

  ws.onopen = function() {
    console.log("Connected to chat server");
  };

  $('#msg').blur(function() {
    ws.send($("#command").val() + $("#msg").val());
    $("#msg").val("");
  });

  $('#join').click(function() {
    ws.send("join " + $('#handle').val());
  });
});

function putMessage(msg) {
  var prompt = "> ";
  $("#chat").append("<p>" + msg + "</p>");
}