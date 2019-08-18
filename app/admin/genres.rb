ActiveAdmin.register Genre do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
     permitted = [:name]
     permitted << :other if params[:action] == 'create' && current_user.superadmin?
     permitted
   end

  index do
    id_column
    column :image_title
    actions
  end

  index as: :grid do |product|
    link_to (product.name), admin_genre_path(product)
  end

  
end
