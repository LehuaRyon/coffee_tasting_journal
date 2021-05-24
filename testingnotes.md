patch '/coffees/:id' do
        get_coffee
        redirect_if_not_authorized
        @coffee.update(name: params[:name], roaster: params[:roaster], producer: params[:producer], variety: params[:variety], process: params[:process], notes: params[:notes])
        redirect "/coffees/#{@coffee.id}"
end

<div class="show_buttons">
    <div>
        <p><a href="/coffees/<%= @coffee.id %>/edit"><button class="button">Edit This Coffee Log</button></a></p>
        <form action="/coffees/<%= @coffee.id %>" method="post">
            <p><input type="hidden" name="_method" value="delete"/>
            <input class="button" type="submit" value="Delete This Coffee Log"/></p>
        </form>
    </div>
</div>