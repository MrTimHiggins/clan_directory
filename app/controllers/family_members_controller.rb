class FamilyMembersController < ApplicationController
  def edit
    @family_member = FamilyMember.find_by_id(params[:id])
    @contact_info = @family_member.contact_info
  end
end
