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

in show:
<h2><%= @coffee.name %></h2>

<img id="show_image" src="https://assets.rebelmouse.io/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZSI6Imh0dHBzOi8vYXNzZXRzLnJibC5tcy8yMzIxNjQ2My9vcmlnaW4uanBnIiwiZXhwaXJlc19hdCI6MTY3Njk4Mjg3MX0.4D2MPJW7OJI2KyBWOKAI72HnvEi9IAN5Y01-r60YhB4/img.jpg?width=1200&coordinates=0%2C1066%2C0%2C1066&height=600" />

<h4>Roaster:</h4>
<p><%= @coffee.roaster %></p>

<h4>Producer:</h4>
<p><%= @coffee.producer %></p>

<h4>Variety:</h4>
<p><%= @coffee.variety %></p>

<h4>Process:</h4>
<p><%= @coffee.process %></p>

<h4>Notes:</h4>
<p><%= @coffee.notes %></p>

<p><a href="/coffees/<%= @coffee.id %>/edit"><button class="button">Edit This Coffee Log</button></a></p>

<form action="/coffees/<%= @coffee.id %>" method="post">
    <p><input type="hidden" name="_method" value="delete"/>
    <input class="button" type="submit" value="Delete This Coffee Log"/></p>
</form>
<br>
