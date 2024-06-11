class Education < ApplicationRecord
  belongs_to :resume

  enum degree: {
    high_school: 0,
    tecnical_school: 1,
    bachelors_degree: 3,
    masters_degree: 4,
    doctorate: 5
  }
end
