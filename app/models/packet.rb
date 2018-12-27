# frozen_string_literal: true

class Packet < ApplicationRecord
  validates :used_at, uniqueness: true
end
