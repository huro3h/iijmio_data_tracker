# frozen_string_literal: true

class Packet < ApplicationRecord
  validates :used_at, uniqueness: true

  scope :current_month, -> { where(used_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  def self.not_latest?
    Date.yesterday != self.order(used_at: :desc).first.used_at
  end
end
