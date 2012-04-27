module UsersHelper
  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def remove_sensitive_error_messages_from_user(user)
    @user.errors.full_messages.delete_if { |msg| msg =~ /digest/ }
  end
end
