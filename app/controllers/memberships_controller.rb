# coding: utf-8

class MembershipsController < ApplicationController
  before_filter :find_artist

  def create
    @membership = @artist.memberships.build(member_id: params[:member_id])

    if @membership.save
      redirect_to artist_url(@artist), notice: 'Эмси добавлен в группу.'
    else
      redirect_to artist_url(@artist), notice: 'Не удалось добавить эмси в группу.'
    end
  end

  def destroy
    @membership = @artist.memberships.find(params[:id])
    @membership.destroy
    redirect_to artist_url(@artist), notice: 'Эмси был удален из группы.'
  end

  private

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end
end
