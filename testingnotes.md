<p><a href="/coffees/new"><button>Create New Coffee Log</button></a></p>
<ol>
    <% @coffees.each do |c| %>
    <li>
        <% if current_user == c.user %>
                <p><a href="/coffees/<%= c.id %>/edit"><button>Edit</button></a>  <%= c.roaster %> - <%= c.name %> - <%= c.producer %> - <%= c.variety %> - <%= c.process %> - <%= c.notes %></p>
        <% end %>
    </li>    
    <% end %>
</ol>
