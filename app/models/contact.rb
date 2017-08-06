class Contact < ApplicationRecord
  belongs_to :kind

  def kind_description
    kind.description
  end

  def as_json(options={})
    super(methods: :kind_description, include: {kind: {except: :description}})
  end
end
