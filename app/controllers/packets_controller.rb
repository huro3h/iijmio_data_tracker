# frozen_string_literal: true

class PacketsController < ApplicationController
  def index
    # @packets = Packet.last
  end

  private

  def packet_params
    params.require(:packet).permit(:amount, :used_at)
  end
end
