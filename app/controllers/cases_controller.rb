class CasesController < ApplicationController
  def create
    theme = Theme.find(params[:theme_id])
    @case = theme.cases.build(params[:case])

    respond_to do |format|
      if @case.save
        format.html { redirect_to theme_path(@case.theme), notice: 'Case was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @case = Case.find(params[:id])
  end

  def update
    @case = Case.find(params[:id])

    respond_to do |format|
      if @case.update_attributes(params[:case])
        format.html { redirect_to theme_path(@case.theme), notice: 'Theme was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @case = Case.find(params[:id])
    theme_id = @case.theme.id
    @case.destroy

    respond_to do |format|
      format.html { redirect_to theme_path(theme_id) }
      format.json { head :ok }
    end
  end

end
