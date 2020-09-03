module EventsHelper
  def already_subscribe?
    attendees = @event.attendees
    current_user = User.where(id: session[:current_user_id])
    attendees.include?(current_user[0])
  end
end
