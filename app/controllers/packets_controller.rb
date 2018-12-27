# frozen_string_literal: true

class PacketsController < ApplicationController
  def index
    if Packet.exist_past30days_data?
      shape_data = Iijmio.generate_packet_data
      shape_data.each do |daily_data|
        packet = Packet.new(packet_params)
        packet.amount = daily_data.amount
        packet.date = daily_data.date
        packet.save
      end
    end
    @packets = Packet.where.not(id: nil).limit(10)
  end

  private

  def packet_params
    params.require(:packet).permit(:amount, :used_at)
  end
end
