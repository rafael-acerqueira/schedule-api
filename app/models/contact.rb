class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address

  # def kind_description
  #   kind.description
  # end
  #
  # def as_json(options={})
  #   hash = super(methods: :kind_description, include: [:kind, :phones, :address])
  #   hash[:birthdate] = I18n.l(self.birthdate) if birthdate.present?
  #   hash
  # end
end
