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

<div class="index">
    <img class="img-fluid" src="https://cdn.shopify.com/s/files/1/0187/0338/files/Screen_Shot_2020-06-29_at_8.24.58_AM.png?v=1593437153" />
    <div class="index__text">
        <h2 style="margin-left: 300px;">Coffees</h2>
            <ol>
                <% @coffees.each do |c| %>
                <li>
                    <% if current_user == c.user %>
                            <p><a href="/coffees/<%= c.id %>/edit"><button class="button">Edit</button></a>  <%= c.roaster %> - <%= c.name %> - <%= c.producer %> - <%= c.variety %> - <%= c.process %> - <%= c.notes %></p>
                    <% end %>
                </li>    
                <% end %>
                <br>
            </ol>
    </div>
</div>

