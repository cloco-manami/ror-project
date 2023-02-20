module UsersHelper
  def format_name(user)
    if user.gender == 1
      "Mr. #{user.first_name} #{user.last_name}"
    elsif user.gender.zero?
      "Ms. #{user.first_name} #{user.last_name}"
    else
      "#{user.first_name} #{user.last_name}"
    end
  end

  def format_height(user)
    return if user.height.blank?

    "#{user.height} cm"
  end

  def format_weight(user)
    return if user.weight.blank?

    "#{user.weight} kg"
  end

  def format_gender(user)
    return if user.gender.blank?

    GENDER_OPTIONS[user.gender]
  end
end
