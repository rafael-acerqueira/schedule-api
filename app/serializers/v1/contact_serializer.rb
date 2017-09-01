module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate

    belongs_to :kind do
      link(:related){v1_contact_kind_url(object.id)}
    end

    has_many :phones do
      link(:related){v1_contact_phones_url(object.id)}
    end

    has_one :address do
      link(:related){v1_contact_address_url(object.id)}
    end

    link(:self){v1_contact_url(object.id)}


    def attributes(*args)
      hash = super(*args)
      # pt-BR --> hash[:birthdate] = I18n.l(object.birthdate) if object.birthdate.present?
      hash[:birthdate] = object.birthdate.to_time.iso8601 if object.birthdate.present?
      hash
    end
  end
end
