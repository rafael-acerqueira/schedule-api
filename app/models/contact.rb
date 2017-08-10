class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  accepts_nested_attributes_for :phones

  def kind_description
    kind.description
  end

  def as_json(options={})
    hash = super(methods: :kind_description, include: {kind: {except: :description}})
    hash[:birthdate] = I18n.l(self.birthdate) if birthdate.present?
    hash
  end
end
