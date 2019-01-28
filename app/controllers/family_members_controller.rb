class FamilyMembersController < ApplicationController
  def edit
    @family_member = FamilyMember.find_by_id(params[:id])
  end
end
