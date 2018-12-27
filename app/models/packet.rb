# frozen_string_literal: true

class Packet < ApplicationRecord
  validates :used_at, uniqueness: true

  def self.latest?
    Date.today == Packet.last.used_at.to_date
  end
end
