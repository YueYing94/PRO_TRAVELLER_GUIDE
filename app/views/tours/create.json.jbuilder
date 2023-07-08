if @tour.persisted?
  json.inserted_item render(partial: "tours/my_tour", formats: :html, locals: {user: current_user, tour: Tour.new})
else
  json.form render(partial: "shared/form", formats: :html, locals: {tour: @tour})
end
