ActiveAdmin.register Customer do
  actions :index, :edit, :update, :create, :new, :destroy

  permit_params :full_name, :phone_number, :email, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column "Image" do |customer|
      if customer.image.attached?
        image_tag customer.image.variant(resize_to_limit: [100, 100])
      else
        "No Image"
      end
    end
    actions
  end


  filter :full_name
  filter :phone_number
  filter :email

  form do |f|
    f.inputs 'Customer Information' do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |cust|
        if cust.image.attached?
          image_tag url_for(cust.image), width: "50%"
        else
          "No image attached"
        end
      end
    end
  end
end
