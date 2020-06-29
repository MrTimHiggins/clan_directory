class FamilyMembersController < ApplicationController
  def edit
    @family_member = FamilyMember.find_by_id(params[:id])
    @contact_info = @family_member.contact_info
  end

  def create
    fm = FamilyMember.new(family_member_params)
    ci = ContactInfo.new(contact_info_params.merge(family_member_id: fm.id))

    if fm.save || ci.save
      flash[:notice] = "Family member successfully created."
      redirect_to root_path
    else
      error_messages = @fm.errors.full_messages + @ci.errors.full_messages
      flash[:errors] = error_messages.join('<br>')
      redirect_to root_path
    end
  end

  def update
    @family_member = FamilyMember.find_by_id(params[:id])
    @contact_info = @family_member.contact_info || ContactInfo.new(family_member_id: @family_member.id)

    @family_member.assign_attributes(family_member_params)
    @contact_info.assign_attributes(contact_info_params)

    if @family_member.changed? || @contact_info.changed?
      @family_member.save
      @contact_info.save

      flash[:notice] = "Family member successfully updated."
      redirect_to root_path
    else
      flash[:errors] = @family_member.errors.full_messages.join('<br>')
      redirect_to root_path
    end
  end

  def destroy
    @family_member = FamilyMember.find_by_id(params[:id])

    if @family_member.destroy
      flash[:notice] = "Family member successfully deleted."
      redirect_to root_path
    else
      flash[:errors] = @family_member.errors.full_messages.join('<br>')
      redirect_to root_path
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
