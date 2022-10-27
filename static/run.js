const client = new tmi.Client({
  channels: ['jackdvpt']
});

function send() {
  const divElem = document.querySelector(".myTable");
  const inputElements = divElem.querySelectorAll("input, select, checkbox, textarea")
  var output = {}
  for (var i = 0; i < inputElements.length; i++) {
    output[inputElements[i].name] = inputElements[i].value
  }
  console.log(output)
  $.ajax("http://127.0.0.1:8080/score", {
    data: JSON.stringify(output),
    contentType: 'application/json',
    type: 'POST'
  });

  $("#myTable tr").remove();
}



function sendNonChat() {
  const divElem = document.querySelector(".customTable");
  const inputElements = divElem.querySelectorAll("input, select, checkbox, textarea")
  console.log(inputElements[1].value)
  var output = {}
  output[inputElements[0].value] = inputElements[1].value
  $.ajax("http://127.0.0.1:8080/score", {
    data: JSON.stringify(output),
    contentType: 'application/json',
    type: 'POST'
  });

  $('#CustomScore').val('');
  $('#CustomName').val('');
}
function addRow(name, thing) {
  console.log(name, thing)
  var table = document.getElementById("myTable");
  var row = table.insertRow(0);

  var c1 = row.insertCell(0)
  var c2 = row.insertCell(1)
  var c3 = row.insertCell(2)

  c1.className = "named"
  c1.innerHTML = name
  c2.innerHTML = thing
  c3.innerHTML = `<input type="number" id="` + name + `" name="` + name + `"
  min="-2147483648" max="2147483647">`

}
client.on("connected", () => {
  let ele = document.getElementById('container');
  let node = document.createTextNode('Reading from Twitch! ✅');
  ele.appendChild(node);
  console.log('Reading from Twitch! ✅')

});

client.on("disconnected", () => {
  let ele = document.getElementById('container');
  let node = document.createTextNode('done Reading from Twitch! ✅');
  ele.appendChild(node);
  console.log('done Reading from Twitch! ✅')

});

function dc(){
  client.disconnect();
}
client.connect();
client.on('message', (channel, tags, message, self) => {

  var chat = message.split(" ")[0];
  if (chat == "!guess") {
    var thing = message
    console.log(thing, tags.username);
    addRow(tags.username, thing)
  }
});