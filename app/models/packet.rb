# frozen_string_literal: true

class Packet < ApplicationRecord
  validates :used_at, uniqueness: true

  scope :current_month, -> { where(used_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :last_month, -> { where(used_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month) }

  scope :total_amount, -> { pluck(:amount).sum }

  def self.not_latest?
    Date.yesterday != self.order(used_at: :desc).first.used_at
  end
end
