ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "gmail.com",
    :user_name            => "apprentice@icue.co.uk",
    :password             => "business1",
    :authentication       => "plain",
    :enable_starttls_auto => true

                                    }