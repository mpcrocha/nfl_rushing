# frozen_string_literal: true

class JsonApiController < ApplicationController
  PER_PAGE = 10

  def results(entity, filter, per_page = PER_PAGE)
    @results = entity.where(filter).order(sort_params(params[:sort])).paginate(page: current_page, per_page: per_page)
  end

  def pages_info
    { per_page: params[:per_page] || PER_PAGE, total_pages: total_pages, current_page: current_page }
  end

  private

  def current_page
    (params.to_unsafe_h.dig('page', 'number') || 1).to_i
  end

  def total_pages
    @total_pages ||= @results.total_pages
  end

  def sort_params(sort_fields)
    attributes = sort_fields.to_s.split(',')
    attributes.each_with_object({}) do |field, hash|
      if field.start_with?('-')
        field = field[1..-1]
        hash[field] = :desc
      else
        hash[field] = :asc
      end
    end
  end
end
