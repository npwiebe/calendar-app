module RescuesController
  RESCUED_ACTIONS = %w[index, create, show, update, delete]
  def self.prepended(base)
    RESCUED_ACTIONS.each do |action|
      define_method :"#{action}" do
        begin
          super()
        rescue => e
          render json:
                   "#{controller_name.classify} error. Error in #{action}, error: #{e}"
        end
      end
    end
  end
end
