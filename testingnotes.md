patch '/coffees/:id' do
        get_coffee
        redirect_if_not_authorized
        @coffee.update(name: params[:name], roaster: params[:roaster], producer: params[:producer], variety: params[:variety], process: params[:process], notes: params[:notes])
        redirect "/coffees/#{@coffee.id}"
end

in show:
<div class="show_buttons">
    <div>
        <p><a href="/coffees/<%= @coffee.id %>/edit"><button class="button">Edit This Coffee Log</button></a></p>
        <form action="/coffees/<%= @coffee.id %>" method="post">
            <p><input type="hidden" name="_method" value="delete"/>
            <input class="button" type="submit" value="Delete This Coffee Log"/></p>
        </form>
    </div>
</div>

in edit:
<h2>Editting <%= @coffee.name %></h2>

<img id="edit_image" src="https://images.ctfassets.net/xez96kpzhlbh/554RHcofA4IWIUAmGIcIcE/3b902d714641f313822fedae8aed8ebc/kaffeeverkostung-coffee-tasters-flavor-wheel.jpg" />

<form action="/coffees/<%= @coffee.id %>" method="post" id="delete_button">
    <input type="hidden" name="_method" value="delete"/>
    <input class="button" type="submit" value="Delete Coffee Log"/>
</form>

<form action="/coffees/<%= @coffee.id %>" method="post" class="form">
  <input type="hidden" name="_method" value="patch"/>

  <p><label for="name">Name:</label>
  <input type="text" name="name" value="<%= @coffee.name %>"/>

  <label for="roaster">Roaster:</label>
  <input type="text" name="roaster" value="<%= @coffee.roaster %>"/>

  <label for="producer">Producer:</label>
  <input type="text" name="producer" value="<%= @coffee.producer %>"/>

  <label for="variety">Variety:</label>
  <input type="text" name="variety" value="<%= @coffee.variety %>"/>

  <label for="process">Process:</label>
  <input type="text" name="process" value="<%= @coffee.process %>"/>

  <label for="notes">Notes:</label>
  <textarea name="notes" rows="5" cols="24"><%= @coffee.notes %></textarea></p>

  <input class="button" type="submit" value="Submit Edited Coffee Log"/>
</form>
  

 
