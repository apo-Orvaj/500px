require 'console_table'

module ConsoleTable

    def self.print(table_items)
        ConsoleTable.define(["Name", "Feature", "Highest Pulse", "Impressions"]) do |table|
            table_items.each do |item|
                table << item
            end
        end
    end
end
