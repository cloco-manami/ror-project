class UserCreateForm
  include ActiveModel::Model

  attr_accessor :first_name,
                :last_name,
                :first_name_kana,
                :last_name_kana,
                :age,
                :gender,
                :password,
                :birth_date,
                :height,
                :weight

  validates :first_name, presence: true, length: { in: 1..25 }
  validates :last_name, presence: true, length: { in: 1..25 }
  validates :first_name_kana, presence: true, length: { in: 1..25 }, format: {
    with: KANA_VALIDATION_FORMAT,
    message: "Field must be in Katakana format.",
    allow_blank: true
  }
  validates :last_name_kana, presence: true, length: { in: 1..25 }, format: {
    with: KANA_VALIDATION_FORMAT,
    message: "Field must be in katakana format.",
    allow_blank: true
  }
  validates :birth_date, presence: true
  validates :height, numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than_or_equal_to: 500 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }

  def initialize(params = {})
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @first_name_kana = params[:first_name_kana]
    @last_name_kana = params[:last_name_kana]
    @gender = params[:gender]
    @email = params[:email]
    @password = params[:password]
    @birth_date = params[:birth_date]
    @height = params[:height]
    @weight = params[:weight]
  end
end