module UsersHelper
  def profile_edit
    if current_user.id == @user.id
      link_to 'Edit', edit_user_path(@user)
    end
  end
end
