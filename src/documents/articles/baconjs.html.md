---
title: "Bacon.js"
descr: "Problem solving for front-end developers using functional reactive programming."
more: "Read more →"
date: 2013-03-30
layout: "article"
status: "draft"
isArticle: true
---
I want to make a demo of Bacon.js which is by the way awesome. Why is it awesome? It makes some tasks solvable without too much thinking.

``` javascript
var clicks = $(".submit").asEventSource("click")
```

Let's say you have a REST API to create playlists (in json) and fill them with real audio tracks (in all kinds of audio formats).

The UI is a form with playlist's title and a list of audio files. When the user clicks send button your program have to POST a document and if the request was successful then PUT each file. 

Ok. That's trivial.
But the files are large and there are many of them. The user needs to see the status of uploads and also wants an ability to cancel the upload of a file added by mistake.

How do you approach this problem? A typical OOP way is to build some objects which represent action statuses and abstract out raw REST requests. You'll end up with MVSomething pattern (could be MVC, MVP or MVVM). I won't tell you why OOP is bad [link] (actually only class based OOP is bad [another link]). I'll just show you another way of solving this task.

The other way is to use Bacon.js. This library lets you represent an eventful system as signal processing network. Anything which can fire an event turns into event stream which you can plug into a box which will do something useful. [snoska Actually there are two kinds of streams: event stream for something discrete and property for something continuos]. There are a lot of boxes for all kind of useful actions like merging or combining streams or mapping them to some data.

You create event streams to POST playlist and then PUT audio tracks. Then you combine the streams of requests results into one stream which you map to a data structure appropriate for uploads visualisation. The structure will look like this: {"request1id":"done", "request2id":"uploading","request3id":"error"}
Whenever new structure comes in your code will update the UI creating everything missing and updating everything present.
 
To make cancel buttons work you create another stream of events with ids and cancel request functions and in the end map it to another data structure:
{"request1id":<function>, "request2id":<function>,"request3id":<function>} 
When the click event kicks in your code takes id of the click button and calls the cancel function which is already there.

The awesomeness of this approach is that you can start to build your solution from any part you comprehend and grow it organically and believe me it won't grow into a plate of spaghetti. The parts of the processing network you have built are easy to extract into separate modules and reuse for something else. I'm also sure describing application logic from the processes point of view is much more useful from the business perspective. But that's another story. 

 
