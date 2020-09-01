class User < ApplicationRecord
    has_many :events, foreign_key: :creator_id, class_name: 'Event'
    has_many :attendences
    has_many :attended_events, through: :attendences, source: :event
end
