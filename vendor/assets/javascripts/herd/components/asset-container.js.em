Herd.AssetContainerComponent = Ember.Component.extend
  action: 'generateChild'
  classNames: ['asset-container']
  bgImage: true
  asset: null
  child: null
  transform: null
  t: null
  n: null
  suffix: null

  combinedName: ~>
    if @suffix
      [@n,@suffix].join '-'
    else
      @n

  +computed child asset
  isImage: ->
    return @asset?.type == 'Herd::Image' unless @child
    @child.type == 'Herd::Image' and !@bgImage

  +computed child asset
  isVideo: ->
    return @asset?.type == 'Herd::Video' unless @child
    @child.type == 'Herd::Video'

  +computed asset child.fileName
  assetUrl: ->
    if @child
      if Ember.empty @child.fileName
        return "https://d13yacurqjgara.cloudfront.net/users/82092/screenshots/1073359/spinner.gif"
      else
        return "#{@child?.absoluteUrl}?b=#{@child.updatedAt.getTime()}"

    else if @asset and (@t or @combinedName)
      @child = @asset if @asset.assetableId == 0
      @child = @asset.n @combinedName if !@child and @combinedName
      @child = @asset.t @t unless @child

      if @child?.fileName and @child?.absoluteUrl
        return @assetUrl

      else if !@child or !@child.fileName
        @assetManager.pushRequest @asset,{
          name: @combinedName
          options: @t
          assetableType: @asset.assetableType
        }, (child) =>
          @child = child unless @isDestroyed

    null
