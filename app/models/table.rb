class Table < ActiveRecord::Base

  belongs_to :employee

  validates :days_worked, :unpaid_vacation_days, length: {in: 0..31}

end
