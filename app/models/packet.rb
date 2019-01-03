# frozen_string_literal: true

class Packet < ApplicationRecord
  validates :used_at, uniqueness: true

  def self.not_latest?
    Date.yesterday != self.order(used_at: :desc).first.used_at
  end
end
