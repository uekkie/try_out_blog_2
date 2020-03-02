class Mail::SendGrid
  def initialize(settings)
    @settings = settings
  end

  def deliver!(mail)
    from = SendGrid::Email.new(email: mail.from.first)
    to = SendGrid::Email.new(email: mail.to.first)
    subject = mail.subject
    #content = SendGrid::Content.new(type: 'text/plain', value: mail.text_part.body.raw_source)
    #content = SendGrid::Content.new(type: 'text/html', value: mail.html_part.body.raw_source)
    sg_mail = SendGrid::Mail.new(from, subject, to)
    #sg_mail.add_content(Content.new(type: 'text/plain', value: mail.text_part.body.raw_source))
    sg_mail.add_content(Content.new(type: 'text/html', value: mail.html_part.body.raw_source))

    sg = SendGrid::API.new(api_key: @settings[:api_key])
    response = sg.client.mail._('send').post(request_body: sg_mail.to_json)

    puts response.status_code
  end
end
