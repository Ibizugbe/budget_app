class GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_group, only: %i[show edit update destroy]

    def index
        @groups = Group.where(user_id: current_user.id)
    end

    def show; end

    def new
        @group = Group.new
    end

    def edit; end

    def create
        @group = Group.new(group_params)
        @group.user_id = current_user.id

        respond_to do |format|
        if @group.save
            format.html { redirect_to group_url(@group), notice: 'Group was successfully created!' }
            format.json { render :show, status: :created, location: @group }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @group.errors, status: :unprocessable_entity }
        end
    end
end