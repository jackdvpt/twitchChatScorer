<html>
<body>


 <form method="post" action="/score">
<table>

        % for i in done:
        <tr>
          </td>
            <td>{{i[0]}}</td>
            
            <td>{{i[1]}}</td>
            <td>{{i[2]}}</td>
            <td> <input type="number" name="{{i[0]}}">
</td>
          </tr>
             % end
             </table>
<input type='submit' value='Submit Form'>
             </form>


</body>

<html>