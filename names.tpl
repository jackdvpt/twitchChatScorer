<html>
<body>
<style>
.button {
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
<input type="submit" class="button" value='Submit Form'>
             </form>




              <form method="post" action="/add_person">
 <input type="text" name="name">
<input type='submit' value='Submit Form'>
             </form>


</body>

<html>