module WeatherHelper
    def formatted_date(date_string)
        parsed_date = Date.parse(date_string)
        formatted_date = parsed_date.strftime('%a, %b %e')
        return formatted_date
    end
end