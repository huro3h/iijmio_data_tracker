# frozen_string_literal: true

class SyncPacket
  def execute
    if (Packet.exists? && Packet.not_latest?) || Packet.count.zero?
      shape_data = Iijmio.generate_packet_data
      shape_data.each do |daily_data|
        packet = Packet.new(amount: daily_data.amount, used_at: daily_data.date)
        packet.save ? packet.save : return
      end
    end
  end
end
