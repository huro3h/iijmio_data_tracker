# frozen_string_literal: true

class Iijmio
  DailyPacket = Struct.new(:date, :amount)

  def initialize
    @agent = Mechanize.new
  end

  # return [Array]
  def collect_track_data
    @agent.user_agent = 'Mac Safari'
    @agent.get(Rails.application.credentials[:iij_login]) do |page|
      page.form_with(action: '/j_security_check') do |form|
        form.field_with(name: 'j_username').value = Rails.application.credentials[:iij_id]
        form.field_with(name: 'j_password').value = Rails.application.credentials[:iij_pass]
      end.submit
    end

    results = ''
    @agent.get(Rails.application.credentials[:iij_viewdata]) do |page|
      form = page.form_with(name: 'lteViewDataForm')
      form.action = Rails.application.credentials[:iij_execute_do]
      result_page = @agent.submit(form)
      results = result_page.search('td.data2-c')
    end
    results.map { |d| d.children.inner_text }
  end

  def monthly_data(data)
    # TODO
  private

  # return [Datetime]
  def format_to_datetime(str)
    formated_date = str.gsub(/(年|月)/, '-').delete('日')
    DateTime.parse(formated_date)
  end

  end
end
