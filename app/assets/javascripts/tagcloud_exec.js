document.ready = function() {
    try {
        TagCanvas.Start('tagCloud','tags',{
        textColour: 'blue',
        outlineColour: '#ff00ff',
        shape: "vring(0.5)",
        reverse: true,
        depth: 0.8,
        maxSpeed: 0.05
      });
    } catch(e) {
      // if something went wrong, hide the tagcloud container
      document.getElementById('tagCloudContainer').style.display = 'none';
    }
  };