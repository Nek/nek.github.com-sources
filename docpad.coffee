# Define the Configuration
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
            title: "My Super Ideas!"
            url: "http://nikdudnik.com"
            author: "Nikita Dudnik"
            email: "nikdudnik@gmail.com"

        getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
        
}

# Export the Configuration
module.exports = docpadConfig
