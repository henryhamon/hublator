# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def activities(streams)
    list = ''

    streams.each do |stream|
      text = link_to image_tag(stream.user.gravatar_url, :class => 'avatar-mini left'), user_path(stream.user)

      text += link_to stream.user.name, user_path(stream.user)

      case stream.streamable_type
        when 'User'
          text += " joined the hublator community."
        when 'Interpreter'
          text += " is new a #{stream.nested.kind} in the #{link_to(stream.nested.page.project.name , project_path(stream.nested.page.project))} project."
        when 'Project'
          text += " create new project - #{link_to(stream.nested.name , project_path(stream.nested))}."
        when 'Connection'
          text += " is now following #{link_to(stream.nested.contact.name , user_path(stream.nested.contact))}."
      end
      yield text
    end
  end

  def network(connections)
    list = ''
    connections.each do |contact|
      list += content_tag(:div, link_to(image_tag(contact.contact.gravatar_url, :class => 'avatar-mini', :title => contact.contact.name), user_path(contact.contact)), :class => 'follow')
    end
    return list
  end

end

