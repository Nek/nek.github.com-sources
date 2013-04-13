moment = require "moment"
#Define the Configuration
docpadConfig = {
    collections:
        pages: ->
            @getCollection("html").findAllLive({isPage:true}).on "add", (model) ->
                model.setMetaDefaults({layout:"default"})
        articles: ->
            @getCollection("html").findAllLive({relativeOutDirPath:"articles"}).on "add", (model) ->
                model.setMetaDefaults({layout:"default"})

                    
    templateData:
        site:
            title: "Abstract Nonsense"
            url: "http://nikdudnik.com"
            author: "Nikita Dudnik"
            email: "nikdudnik@gmail.com"
            services:
                diqus: "abstractnonsense"
                googleAnalytics: "UA-33499743-2"

        getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
        formatDate: (d) -> moment(d).format('Do MMMM YYYY')
        
}

# Export the Configuration
module.exports = docpadConfig
