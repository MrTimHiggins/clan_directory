class FamilyMembersController < ApplicationController
  def edit
    @family_member = FamilyMember.find_by_id(params[:id])
    @contact_info = @family_member.contact_info
  end

  def create
    fm = FamilyMember.new(family_member_params)
    ci = ContactInfo.new(contact_info_params.merge(family_member_id: fm.id))

    if fm.save and ci.save
      redirect_to family_member_edit_path(fm)
    end
  end

  def update
    @family_member = FamilyMember.find_by_id(params[:id])
    @contact_info = @family_member.contact_info || ContactInfo.new(family_member_id: @family_member.id)

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
    params.require(:family_member).permit(:first_name, :last_name, :date_of_birth, :gender, :family_id)
  end

  def contact_info_params
    params.require(:contact_info).permit(:email, :phone_number, :street1, :street2, :city, :state, :zipcode, :family_member_id, :family_id)
  end
end
