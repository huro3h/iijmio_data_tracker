class ConnectsController < ApplicationController
  def index
    iijmio = Iijmio.new
    @res_html = iijmio.connect
  end
end
