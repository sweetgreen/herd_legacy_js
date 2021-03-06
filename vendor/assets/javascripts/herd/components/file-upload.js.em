Herd.FileUploadComponent = Ember.FileField.extend
  multiple: true,
  url: '/herd/assets'
  uploaded: 'uploadFinished'
  progress: 'uploadProgressed'

  +observer files
  filesDidChange: ->
    uploader = Ember.Uploader.create
      url: @url
      paramNamespace: 'asset'
      headers:
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')

    for file in @files
      uploader.upload file, window.assetable

    uploader.on 'progress', (e) =>
      @uploadProgressed(e)

    uploader.on 'didUpload', (e) =>
      @uploadComplete(e)

  uploadComplete: (resp) ->
    @sendAction 'uploaded', resp

  uploadProgressed: (e) ->
    @sendAction 'progress', e
