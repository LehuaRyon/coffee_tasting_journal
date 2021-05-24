 <form action="/coffees/<%= @coffee.id %>" method="post" id ="delete_button">
      <input type="hidden" name="_method" value="delete"/>
      <input type="submit" value="Delete Coffee Log"/>
      <br>
      <br>
      <br>
  </form>