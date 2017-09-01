module V1
  class PhoneSerializer < ActiveModel::Serializer
    attributes :id, :number
  end
end
