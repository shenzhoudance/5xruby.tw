class PagesController < ApplicationController
  def index
    @index_pictures = IndexPicture.includes(:index_picture_imgs).lang(I18n.locale).order(:ordering)
    @talks = Activity::Talk.includes(:translations).available.coming(3)
    @showcases = Showcase.includes(:translations).where(is_online: true).order(:sort_id).first 3
  end

  def contacts
    @contact = Contact.new
  end

  def faq
    @faqs = Faq.where(is_online: true).includes(:translations).order(:sort_id)
  end

  def training
    @showcases = Showcase.where(category: :training).first(3)
  end

  def privacy_policy; end

  def terms_of_service; end

  def space
  end

  def space
  end
end
