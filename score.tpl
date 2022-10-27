<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <title>SCOREBOARD</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/multiple.js/0.0.1/multiple.min.js"
        integrity="sha512-h7sEAeLJrgSKuLDecT6NeHSUlbSwpS30IqGu21caM/sa//cWhp5J5D+MOZ0C5QM4GbJlZeEY1ZXXGVtI5m1arg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&family=Nabla&display=swap');


        .name {
            width: 300px;
            font-size: 35px;
            font-family: 'Fredoka One', cursive;

            padding-top: 4px;
            padding-left: 15px;
            font-weight: bolder;
            float: left;
        }

        .score {
            float: right;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 53px;
            width: 199px;
            font-family: 'Nabla', cursive;
            font-weight: bold;
            font-size: 40px;
        }

        .item {
            color: white;
            box-shadow: 7px 7px #FFDA00;
            /*width: 600px;*/
            padding: 10px;
            border-radius: 1500px;
            background-color: #FF1B8D;
            margin: 10px;
            height: 50px;
        }

        .pos {
            font-size: 30px;
            text-align: center;
            margin-top: 7px;
            font-family: 'Nabla', cursive;
            width: 50px;
            float: left;
        }

        .pic {

            width: 50px;
            float: left;
            border-radius: 25px;
            height: 50px;
            width: 50px;
            background-size: 50px 50px;
        }
    </style>

</head>

<body>
    <script>
        $("html, body").animate({ scrollTop: $(document).height() }, 20000);
setTimeout(function() {
   location.reload();
},15000);

     

    </script>
    <!-- partial:index.partial.html -->
    <div class="center">

        <div class="list">
        % num = 1
        % for p in scores:
            <div class="item">
                <div class="pos">
                   {{num}}
                </div>

                <div class="pic"
                    style="background-image: url({{p["img"]}})">
                </div>
                <div class="name">{{p["name"].upper()}}
                </div>
                <div class="score">

                   {{p["score"]}}
                </div>
            </div>
            % num +=1 
            %end
        
           


         

        </div>
    </div>
    <!-- partial -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
</body>

</html>