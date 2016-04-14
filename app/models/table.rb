class Table < ActiveRecord::Base

  belongs_to :employee

  validates :days_worked, :vacation_days, :unpaid_vacation_days, :days_of_sickness, length: {in: 0..31}

end
