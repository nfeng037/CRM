ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :notes
    column "Image" do |customer|
      if customer.image.attached?
        image_tag customer.image, width: "50px", height: "50px"
      else
        "No Image"
      end
    end
    actions
  end

  filter :full_name
  filter :phone_number
  filter :email
  filter :notes


  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file, hint: f.object.image.attached? ? "Current image: #{f.object.image.filename}" : ''
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), width: "200px", height: "200px"
        end
      end
    end
  end

end
