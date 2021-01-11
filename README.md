<div class="container">
        <div class="row justify-content-md-center">
            <div class="col-8 mt-4">
                <div class="card text-center bg-gray rounded">
                    <div class="card-body">
                        <h5 class="card-title"><%= f.label :title %> <%= f.text_field :title %></h5>
                        <h5 class="card-text"><%= f.label :description %> <%= f.text_area :description %></h5>
                        <%= link_to "Cancel", articles_path,class:"btn btn-outline-info"%>
                        <%= f.submit %>
                    </div>
                </div>
            </div>
        </div>
    </div>