ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
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

end
