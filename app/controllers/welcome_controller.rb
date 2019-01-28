class WelcomeController < ApplicationController
  def home
    @q = params[:search]

    if @q
      @family_members = FamilyMember.where("concat_ws(' ', first_name, last_name) ILIKE ?", "%#{@q.squish}%")
    else
      @family_members = FamilyMember.all
    end
  end

end
