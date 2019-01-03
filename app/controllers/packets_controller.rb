# frozen_string_literal: true

class PacketsController < ApplicationController
  def index
    # @packets = Packet.last
  end

  def execute
    sync_packet = SyncPacket.new
    sync_packet.execute
  end

  # def packet_params
  #   params.require(:packet).permit(:amount, :used_at)
  # end
end
