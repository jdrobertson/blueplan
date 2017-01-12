module ApplicationHelper
  def org_name
    "Testprint"
  end

  def site_name
    "Blueplan"
  end

  def full_title(page_title = '')
    base_title = site_name
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
