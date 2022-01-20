<!DOCTYPE html>
<html lang="en" >
<head>
<meta http-equiv="refresh" content="10">

  <meta charset="UTF-8">
  <title>CodePen - Daily UI #019 | Leaderboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
  @import url("https://fonts.googleapis.com/css?family=Red+Hat+Display:400,900&display=swap");
body, html {
  height: 100%;
  width: 100%;
  overflow: hidden;
  color: #333;
}

.center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 10;
  font-family: "Red Hat Display", sans-serif;
}

.top3 {
  display: flex;
  justify-content: center;
  align-items: flex-end;
  color: #4B4168;
}
.top3 .item {
  box-sizing: border-box;
  position: relative;
  background: white;
  width: 9rem;
  height: 10rem;
  text-align: center;
  padding: 2.8rem 0 0;
  margin: 1rem 1rem 2rem;
  border-radius: 0.5rem;
  transform-origin: bottom;
  cursor: pointer;
  transition: transform 200ms ease-in-out;
  box-shadow: 0 0 4rem 0 rgba(0, 0, 0, 0.1), 0 1rem 2rem -1rem rgba(0, 0, 0, 0.3);
}
.top3 .item .pic {
  position: absolute;
  top: -2rem;
  left: 2.5rem;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
  background-size: cover;
  background-position: center;
  margin-right: 1rem;
  box-shadow: 0 0 1rem 0 rgba(0, 0, 0, 0.2), 0 1rem 1rem -0.5rem rgba(0, 0, 0, 0.3);
}
.top3 .item .pos {
  font-weight: 900;
  font-size: 1.5rem;
  margin-bottom: 0.5rem;
}
.top3 .item .name {
  font-size: 1.1rem;
  margin-bottom: 0.5rem;
}
.top3 .item .score {
  opacity: 0.5;
}
.top3 .item .score:after {
  display: block;
  content: "points";
  opacity: 0.5;
}
.top3 .item.one {
  width: 10rem;
  height: 11rem;
  padding-top: 3.5rem;
}
.top3 .item.one .pic {
  width: 5rem;
  height: 5rem;
  left: 2.5rem;
}
.top3 .item:hover {
  transform: scale(1.05);
}

.list {
  padding-left: 2rem;
  margin: 0 auto;
}
.list .item {
  position: relative;
  display: flex;
  align-items: center;
  background: white;
  height: 3rem;
  border-radius: 4rem;
  margin-bottom: 2rem;
  background: #EAA786;
  transform-origin: left;
  cursor: pointer;
  transition: transform 200ms ease-in-out;
  box-shadow: 0 0 4rem 0 rgba(0, 0, 0, 0.1), 0 1rem 2rem -1rem rgba(0, 0, 0, 0.3);
}
.list .item .pos {
  font-weight: 900;
  position: absolute;
  left: -2rem;
  text-align: center;
  font-size: 1.25rem;
  width: 1.5rem;
  color: white;
  opacity: 0.6;
  transition: opacity 200ms ease-in-out;
}
.list .item .pic {
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
  background-size: cover;
  background-position: center;
  margin-right: 1rem;
  box-shadow: 0 0 1rem 0 rgba(0, 0, 0, 0.2), 0 1rem 1rem -0.5rem rgba(0, 0, 0, 0.3);
}
.list .item .name {
  flex-grow: 2;
  flex-basis: 10rem;
  font-size: 1.1rem;
}
.list .item .score {
  margin-right: 1.5rem;
  opacity: 0.5;
}
.list .item .score:after {
  margin-right: 1rem;
  content: "points";
  opacity: 0.5;
}
.list .item:hover {
  transform: scale(1.05);
}
.list .item:hover .pos {
  opacity: 0.8;
}
</style>

</head>
<body>
<!-- partial:index.partial.html -->
<div class="center">
  <div class="top3">
    <div class="two item">
      <div class="pos">
        2
      </div>
      %if "profile" in scores[1]:
      <div class="pic" style="background-image: url({{scores[1]["profile"]}})"></div>
      % else : 
      <div class="pic" style="background-image: url(https://static-cdn.jtvnw.net/user-default-pictures-uv/13e5fa74-defa-11e9-809c-784f43822e80-profile_image-300x300.png)"></div>

      %end
      <div class="name">
        {{scores[1]["name"]}}
      </div>
      <div class="score">
        
        {{scores[1]["score"]}}
      </div>
    </div>
    <div class="one item">
      <div class="pos">
        1
      </div>
            %if "profile" in scores[0]:
      <div class="pic" style="background-image: url({{scores[0]["profile"]}})"></div>
      % else : 
      <div class="pic" style="background-image: url(https://static-cdn.jtvnw.net/user-default-pictures-uv/13e5fa74-defa-11e9-809c-784f43822e80-profile_image-300x300.png)"></div>

      %end
      <div class="name">
        {{scores[0]["name"]}}
      </div>
      <div class="score">
        {{scores[0]["score"]}}
      </div>
    </div>
    <div class="three item">
      <div class="pos">
        3
      </div>
          %if "profile" in scores[2]:
      <div class="pic" style="background-image: url({{scores[2]["profile"]}})"></div>
      % else : 
      <div class="pic" style="background-image: url(https://static-cdn.jtvnw.net/user-default-pictures-uv/13e5fa74-defa-11e9-809c-784f43822e80-profile_image-300x300.png)"></div>

      %end
      <div class="name">
        {{scores[2]["name"]}}
      </div>
      <div class="score">
        {{scores[2]["score"]}}
      </div>
    </div>
  </div>
  <div class="list">
  % del scores[0]
  % del scores[0]
  % del scores[0]
  % num = 4
  %for person in scores:
    <div class="item">
      <div class="pos">
        {{num}}
      </div>    
      %if "profile" in person:
      <div class="pic" style="background-image: url({{person["profile"]}})"></div>
      % else: 
      <div class="pic" style="background-image: url(https://static-cdn.jtvnw.net/user-default-pictures-uv/13e5fa74-defa-11e9-809c-784f43822e80-profile_image-300x300.png)"></div>
      %end
      <div class="name">
        {{person["name"]}}
      </div>
      <div class="score">
        
        {{person["score"]}}
      </div>
    </div>
    %num += 1
    %end
  </div>
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
</body>
</html>
