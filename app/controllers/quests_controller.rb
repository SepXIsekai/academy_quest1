class QuestsController < ApplicationController
  before_action :set_quest, only: [ :destroy, :toggle_status ]
  def index
    @quests = Quest.order(created_at: :desc)
    @quest = Quest.new
  end

  def show
    # show brag docs
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      redirect_to quests_path, notice: "Quest was successfully created."
    end
  end

  def destroy
    @quest.destroy
    redirect_to quests_path, notice: "Quest was successfully deleted."
  end

  def toggle_status
    @quest.update(status: !@quest.status)
    redirect_to quests_path, notice: "Quest status was successfully updated."
  end
  private

  def quest_params
    params.require(:quest).permit(:name)
  end

  def set_quest
    @quest = Quest.find(params[:id])
  end
end
