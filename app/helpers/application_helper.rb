module ApplicationHelper

  def full_name(investor)
    [investor.first_name, investor.last_name].join(" ")
  end

  def nh(n,p=0)
    number_to_currency(n, :precision => p)
  end

end
