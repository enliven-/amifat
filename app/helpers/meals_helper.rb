module MealsHelper
  
  def meal_highlight_class(date)
     current_user.overeaten?(date) ? 'danger' : 'success'
  end
end
