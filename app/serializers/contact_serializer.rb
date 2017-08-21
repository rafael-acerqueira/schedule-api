class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related){kind_url(object.kind.id)}
  end
  has_many :phones
  has_many :address

  link(:self){contact_url(object.id)}


  def attributes(*args)
    hash = super(*args)
    # pt-BR --> hash[:birthdate] = I18n.l(object.birthdate) if object.birthdate.present?
    hash[:birthdate] = object.birthdate.to_time.iso8601 if object.birthdate.present?
    hash
  end
end
