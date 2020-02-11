class Bug < ApplicationRecord
    belongs_to :user, optional: true

    validates :title, :description, presence: true

    # https://guides.rubyonrails.org/active_record_validations.html#inclusion
    # https://stackoverflow.com/questions/8146965/how-do-i-specify-and-validate-an-enum-in-rails
    # Validation for issue_type, priority, and status
    enum issue_type: [:issue, :enhancement, :feature]
    enum priority: [:low, :medium, :high]
    enum status: [:open, :closed, :monitor]
    validates :issue_type, inclusion: { in: issue_types.keys, message: "%{value} is not valid." }
    validates :priority, inclusion: { in: priorities.keys, message: "%{value} is not valid." }
    validates :status, inclusion: { in: statuses.keys, message: "%{value} is not valid." }
end
