ActiveAdmin.register Model do

  index do
    column :name, sortable: :name do |model|
      link_to model.name, admin_model_path(model)
    end
    column "Combs" do |model|
      model.combs.count.to_s
    end
    default_actions
  end

  show do
    attributes_table do
      row :name
      row "Combs" do |model|
        model.combs.count.to_s
      end
    end
  end
end
