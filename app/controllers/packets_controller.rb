# frozen_string_literal: true

class PacketsController < ApplicationController
  def index
    @packets = Packet.order(used_at: :desc).limit(30)
  end

  def execute
    sync_packet = SyncPacket.new
    sync_packet.execute
    redirect_to :root
    return
  end

  # def packet_params
  #   params.require(:packet).permit(:amount, :used_at)
  # end
end
