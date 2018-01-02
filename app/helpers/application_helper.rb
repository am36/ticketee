module ApplicationHelper
    
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
    end 
  end
  
  def admins_only(&block)
          block.call if current_user.try(:admin?)
  end
  def roles
    hash = {}
    %w(manager editor viewer).each do |role|
      hash[role.titleize] = role
    end
    hash 
  end


end
