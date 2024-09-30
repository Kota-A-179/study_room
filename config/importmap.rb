# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "icon_preview", to: "icon_preview.js"
pin "time_measurement", to: "time_measurement.js"
pin_all_from "app/javascript/channels", under: "channels"