# frozen_string_literal: true

class SyncPacket
  def execute
    unless Packet.is_latest?
      shape_data = Iijmio.generate_packet_data
      shape_data.each do |daily_data|
        packet = Packet.new(packet_params)
        packet.amount = daily_data.amount
        packet.date = daily_data.date
        packet.save
      end
    end
  end
end