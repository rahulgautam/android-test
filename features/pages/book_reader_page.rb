module PageObjectModel
  class BookReaderPage < PageObjectModel::Page
    trait "FrameLayout id:'content'"
    element :bookmarker, "ImageView marked:'Reader bookmark'"
    element :bookmark, "* id:'imageview_bookmark'"
    #TODO: Reading Options menu should be defined as a section or separate page

    @@forward_tapping_point = {x: 90, y: 50}
    @@backward_tapping_point = {x: 10, y: 50}

    def turn_pages(number_of_pages)
      point = number_of_pages.to_i >= 0 ? @@forward_tapping_point : @@backward_tapping_point
      (number_of_pages.to_i.abs).times { tap(point[:x], point[:y]) }
    end

    def toggle_reader_options
      tap(50, 50)
    end

    def open_options_menu
      logger.debug "Opening options menu"
      wait_for(:timeout => timeout_short) {
        toggle_reader_options
      }
    end

    def toggle_bookmark
      wait_for(:timeout => timeout_short) {
        bookmarker.touch
      }
    end

    #TODO: should check for visibility not only existence?
    def has_bookmark?
      bookmark.exists?
    end
  end

  def book_reader_page
    @_book_reader_page ||= page(BookReaderPage)
  end
end
