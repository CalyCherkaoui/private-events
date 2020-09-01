class Attendance < ApplicationRecord
    belongs_to :user, foreign_key: :attendee_id, class_name: 'User'
    belongs_to :event, foreign_key: :attended_event_id, class_name: 'Event'
end
