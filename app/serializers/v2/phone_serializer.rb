module V2
  class PhoneSerializer < ActiveModel::Serializer
    attributes :id, :number
  end
end
