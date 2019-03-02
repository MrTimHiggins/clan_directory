class FamilyMembersController < ApplicationController
  def edit
    @family_member = FamilyMember.find_by_id(params[:id])
    @contact_info = @family_member.contact_info
  end

  def update
    @family_member = FamilyMember.find_by_id(params[:id])
    @contact_info = @family_member.contact_info

    if @family_member.update_attributes(family_member_params) && @contact_info.update_attributes(contact_info_params)
      flash[:notice] = "Family member successfully updated."
      redirect_to edit_family_member_path
    else
      flash[:errors] = @family_member.errors.full_messages.join('<br>')
      redirect_to edit_family_member_path
    end
  end

  private

  def family_member_params
    params.require(:family_member).permit(:first_name, :last_name, :date_of_birth)
  end

  def contact_info_params
    params.require(:contact_info).permit(:email, :phone_number, :street1, :street2, :city, :state, :zipcode)
  end
end
