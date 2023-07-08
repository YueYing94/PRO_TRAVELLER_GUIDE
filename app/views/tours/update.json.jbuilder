if @tour.errors.any?
  json.form render(partial: "shared/form", formats: :html, locals: {tour: @tour})
else
  json.inserted_item render(partial: "tours/tour_infos", formats: :html, locals: {tour: @tour})
end
