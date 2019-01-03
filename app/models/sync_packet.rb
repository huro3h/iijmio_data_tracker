# frozen_string_literal: true

class SyncPacket
  def execute
    unless Packet.latest?
      shape_data = Iijmio.generate_packet_data
      shape_data.each do |daily_data|
        packet = Packet.new
        packet.amount = daily_data.amount
        packet.used_at = daily_data.date
        packet.save
      end
    end
  end
end