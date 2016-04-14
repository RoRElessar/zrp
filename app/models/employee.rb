class Employee < ActiveRecord::Base

  has_many :tables, dependent: :destroy

  def before_save
    self.surname.mb_chars.capitalize!
    self.name.mb_chars.capitalize!
    self.patronymic.mb_chars.capitalize!
  end

  phony_normalize :phone, default_country_code: 'UA'

  validates :name, :surname, :patronymic, :phone, :position, :code, :birthday, :address, :table_number, presence: true
  validates :code, length: {is: 10}
  validates :code, :phone, :table_number, uniqueness: true
  validates :phone, numericality: true
  validates :table_number, :code, :numericality => { greater_than_or_equal_to: 1}
  validates :phone, length: {in: 5..10}
  validates :name, :surname, :patronymic, length: {in: 2..20}
  validates :address, length: {in: 20..60}
  EMAIL_REG_EXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, format: {with: EMAIL_REG_EXP}
  validates :note, length: {maximum: 200}

  def self.search(search)
    if search
      where('surname ILIKE ?', "%#{search}%")
    else
      Employee.all
    end
  end

end
