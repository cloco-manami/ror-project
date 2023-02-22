class UniqueEmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && User.where(email: record.email).present?
      record.errors.add(attribute, "Email is already taken")
    end
  end
end
