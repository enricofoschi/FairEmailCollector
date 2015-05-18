class @Helpers.Token

    @GetRandom: ->
        Math.floor((1 + Math.random()) * 0x10000).ToString(16).substring(1)

    @GetGuid: ->
        s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()