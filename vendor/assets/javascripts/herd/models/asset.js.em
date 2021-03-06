class Herd.Asset extends DS.Model
  createdAt: DS.attr 'date'
  updatedAt: DS.attr 'date'
  fileName: DS.attr 'string'
  fileSize: DS.attr 'number'
  contentType: DS.attr 'string'
  type: DS.attr 'string'
  url: DS.attr 'string'
  position: DS.attr 'number'
  metadata: DS.attr 'raw'

  width: DS.attr 'number'
  height: DS.attr 'number'

  assetableId: DS.attr 'number'
  assetableType: DS.attr 'string'

  parentAsset: DS.belongsTo 'asset', { inverse: 'childAssets' }
  childAssets: DS.hasMany 'asset', { inverse: 'parentAsset' }

  transform: DS.belongsTo 'transform'

  childTransforms: ~>
    @childAssets.mapBy 'transform'

  t: (trans) ->
    @childAssets.find (item, ix) ->
      item.transform == trans || item.transform?.options == trans

  n: (name) ->
    @childAssets.find (item, ix) ->
      item.transform.name == name

  absoluteUrl: ~> 
    if @url.charAt(0) == '/' and @url.charAt(1) != '/' and (host = @store.adapterFor('application').host)
      host + @url
    else
      @url

