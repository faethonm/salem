class Permutator < ActiveRecord::Base
  has_many :contacts, dependent: :destroy

   def generate_emails(params)
    @fn = params[:first_name].downcase
    @ln = params[:last_name].downcase
    @mn = params[:middle_name].downcase
    @dom = params[:company_domain].downcase
    @company = params[:company_name].downcase
    @fi = @fn.split('').first
    @li = @ln.split('').first
    @results = append_domain(emails)
    # result = {
    #   simple: append_domain(simple),
    #   basics: append_domain(basics),
    #   backwards: append_domain(backwards),
    #   using_middle_name: append_domain(using_middle_name),
    #   dashes: append_domain(dashes),
    #   underscores: append_domain(underscores)
    # }
  end

  private

  def append_domain(list)
    if @dom.present?
      list.map { |email| email + "@#{@dom}"}
    else
      list.map { |email| email + "@#{@company}.com"}
    end
  end

  def emails
    # emails ||= simple + basics + backwards + using_middle_name + dashes + underscores
    emails ||= basics
  end

  def simple
    ["#{@fn}","#{@ln}"]
  end

  def basics
    [
     "#{@fn}#{@ln}",
     "#{@fn}.#{@ln}"
     # "#{@fi}#{@ln}",
     # "#{@fi}.#{@ln}",
     # "#{@fn}#{@li}",
     # "#{@fn}.#{@li}",
     # "#{@fi}#{@li}",
     # "#{@fi}.#{@li}"
    ]
  end

  def backwards
    [
     "#{@ln}#{@fn}",
     "#{@ln}.#{@fn}",
     "#{@ln}#{@fi}",
     "#{@ln}.#{@fi}",
     "#{@li}#{@fn}",
     "#{@li}.#{@fn}",
     "#{@li}#{@fi}",
     "#{@li}.#{@fi}"
    ]
  end

  def using_middle_name
    [
     "#{@fi}#{@mi}#{@ln}",
     "#{@fi}#{@mi}.#{@ln}",
     "#{@fn}#{@mi}#{@ln}",
     "#{@fn}.#{@mi}.#{@ln}",
     "#{@fn}#{@mn}#{@ln}",
     "#{@fn}.#{@mn}.#{@ln}"
    ]
  end

  def dashes
    [
      "#{@fn}-#{@ln}",
      "#{@fi}-#{@ln}",
      "#{@fn}-#{@li}",
      "#{@fi}-#{@li}",
      "#{@ln}-#{@fn}",
      "#{@ln}-#{@fi}",
      "#{@li}-#{@fn}",
      "#{@li}-#{@fi}",
      "#{@fi}#{@mi}-#{@ln}",
      "#{@fn}-#{@mi}-#{@ln}",
      "#{@fn}-#{@mn}-#{@ln}"
    ]
  end

  def underscores
    [
      "#{@fn}_#{@ln}",
      "#{@fi}_#{@ln}",
      "#{@fn}_#{@li}",
      "#{@fi}_#{@li}",
      "#{@ln}_#{@fn}",
      "#{@ln}_#{@fi}",
      "#{@li}_#{@fn}",
      "#{@li}_#{@fi}",
      "#{@fi}#{@mi}_#{@ln}",
      "#{@fn}_#{@mi}_#{@ln}",
      "#{@fn}_#{@mn}_#{@ln}"
    ]
  end
end
