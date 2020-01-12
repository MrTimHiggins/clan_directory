class WelcomeController < ApplicationController
  def home
    @q = params[:search]

    if @q
      @family_members = FamilyMember.where("concat_ws(' ', first_name, last_name) ILIKE ?", "%#{@q.squish}%").includes(:contact_info).order(:first_name)
    else
      @family_members = FamilyMember.all.includes(:contact_info).order(:first_name)
    end
  end

end
