<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/tmi.min.js"></script>
    <style>
    
button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
    </style>
</head>

<body>
<table class="customTable" id="customTable">

    <button onclick="sendNonChat()"> SUBMIT NON CHAT SCORES</button>SET CUSTOM SCORE FOR NAME
    <tbody><tr><td>NAME<input id="CustomName" name="CustomName" ></td><td> SCORE<input type="number" id="CustomScore" name="CustomScore" min="-2147483648" max="2147483647"></td></tr></tbody></table>

 <div id='container'>
        <p>
        </p>
    </div>
    <button onclick="send()"> SUBMIT SCORES</button>
     
    <table class="myTable" id="myTable">

    </table>



    <script src="/static/run.js"></script>
</body>

</html>