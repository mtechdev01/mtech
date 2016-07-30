ObserveJS.bind 'FB', class
  root: document.createElement('div')
  @::root.id = 'fb-root'

  loaded: =>
    if !document.body.contains(@root)
      document.body.appendChild(@root)

    if FB?
      FB.XFBML.parse()
    else
      @initialize()

  initialize: =>
    js = document.createElement('script')

    script = document.getElementsByTagName('script')[0]
    js = document.createElement('script')
    js.id = 'facebook-jssdk'
    js.src = "//connect.facebook.net/fr_FR/all.js#xfbml=1&appId=708003905969064&version=2.6"
    script.parentNode.insertBefore(js, script)
