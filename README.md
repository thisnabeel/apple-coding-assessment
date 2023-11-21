# Weather Forecast App

## Overview

This is a Ruby on Rails application for retrieving weather forecasts. It utilizes external APIs, including Google Maps API and Visual Crossing API, to fetch location suggestions and weather data.

[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png)](#setup)

## ➤ Setup

### Ruby version

Ensure you have Ruby version 3.2.2 installed.

### System dependencies

Make sure you have the required system dependencies installed. Check the Gemfile for details.

### Configuration

1. Create an application.yml file in the config directory.
2. Add your API keys to the application.yml file:

```yaml
GOOGLE_MAPS_API_KEY: YOUR_GOOGLE_MAPS_API_KEY
VISUAL_CROSSING_API_KEY: YOUR_VISUAL_CROSSING_API_KEY
```

3. Run bundle install to install the required gems.

### Database creation and initialization

This application does not require a database, as it relies on external APIs for data.

[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png)](#how-to-run-the-test-suite)

## ➤ How to run the test suite

### Run the tests with:

```bash
rails test
```

### Run the tests with:

```bash
rspec
```

[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png)](#services)

## ➤ Services

This application makes use of external services, including job queues for asynchronous processing and cache servers for caching weather data.

[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png)](#deployment-instructions)

## ➤ Deployment instructions

Deploy the application using your preferred hosting platform. Make sure to set up environment variables for your API keys.

[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png)](#usage)

## ➤ Usage

1. Run the Rails server:

```bash
rails server
```

2. Visit http://localhost:3000 in your browser.
3. Enter a location in the search bar to get a weather forecast.

[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png)](#code-structure)

## ➤ Code Structure

The primary controller responsible for weather forecasts is WeatherController. It uses helper classes such as CoordinatesFinder, AddressSuggestor, and ForecastFinder to interact with external APIs.

The front end is implemented using StimulusJS for dynamic interactions.

[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png)](#additional-information)

## ➤ Additional Information

The application uses Tailwind CSS for styling.
Gemfile includes dependencies for testing, debugging, and other development-related tools.
Figaro gem is used for managing sensitive API keys.
HTTParty gem is utilized for making HTTP requests to external APIs.
Feel free to explore the codebase for more details on the implementation.
