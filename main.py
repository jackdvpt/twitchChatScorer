
import sys
import time

from PIL import Image, ImageDraw

import logging
logging.basicConfig(level=logging.INFO)

sys.path.append('../')
from obswebsocket import obsws, requests  # noqa: E402


host = "localhost"
port = 4444
password = "secret"

ws = obsws(host, port, password)
ws.connect()



try:
 
    img = Image.new('RGB', (100, 30), color = (73, 109, 137))
    
    d = ImageDraw.Draw(img)
    d.text((10,10), "Hello World", fill=(255,255,0))
    
    img.save('pil_text.png')
    print(ws.call(requests.CreateSource("jank1233332e34", "image_source", "Scene 3", "{'file': 'C:/Users/Jack/Pictures/vent.png', 'linear_alpha': False, 'unload': False}", True)))
    #types = ws.call(requests.GetSourceSettings("jank122"))

    """Create a source and add it as a sceneitem to a scene.

    :Arguments:
       *sourceSettings*
            type: Object (optional)
            Source settings data.
       *setVisible*
            type: boolean (optional)
            Set the created SceneItem as visible or not. Defaults to true
    :Returns:
       *itemId*
            type: int
            ID of the SceneItem in the scene.
    """

except KeyboardInterrupt:
    pass

ws.disconnect()