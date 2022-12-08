return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 60,
  height = 12,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 4,
  nextobjectid = 62,
  properties = {},
  tilesets = {
    {
      name = "Dark Forest",
      firstgid = 1,
      class = "",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 12,
      image = "../assets/Dark Forest.png",
      imagewidth = 384,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      wangsets = {},
      tilecount = 96,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 12,
      id = 1,
      name = "ground",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 2, 25, 3, 0, 25, 0, 0, 25, 0, 25, 0, 2, 25, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 25, 25, 0, 0, 2, 25, 3, 0, 0, 2, 25, 25, 3, 0, 2, 25, 3, 0, 2, 25, 3, 0, 0, 2, 3, 0, 0, 0, 0,
        0, 0, 0, 14, 0, 0, 14, 0, 0, 15, 0, 15, 0, 14, 0, 15, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 2, 0, 0, 3, 0, 14, 0, 15, 0, 0, 14, 0, 0, 15, 0, 14, 0, 15, 0, 14, 0, 0, 0, 2, 0, 0, 3, 0, 0, 0,
        0, 0, 0, 14, 0, 0, 14, 0, 0, 15, 0, 15, 0, 14, 0, 0, 0, 0, 14, 25, 0, 0, 0, 0, 0, 0, 0, 25, 15, 0, 14, 0, 0, 15, 0, 14, 0, 0, 0, 0, 14, 0, 0, 0, 0, 14, 0, 0, 0, 14, 0, 0, 0, 14, 0, 0, 15, 0, 0, 0,
        0, 0, 0, 14, 0, 0, 14, 25, 25, 15, 0, 15, 0, 14, 25, 3, 0, 0, 0, 14, 3, 0, 0, 25, 0, 0, 2, 15, 0, 0, 14, 25, 25, 15, 0, 14, 25, 3, 0, 0, 14, 0, 0, 0, 0, 14, 25, 3, 0, 14, 25, 3, 0, 14, 0, 0, 15, 0, 0, 0,
        0, 0, 0, 14, 0, 0, 14, 0, 0, 15, 0, 15, 0, 0, 0, 15, 0, 0, 0, 0, 15, 0, 3, 0, 2, 0, 15, 0, 0, 0, 14, 0, 0, 15, 0, 0, 0, 15, 0, 0, 14, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 15, 0, 14, 0, 0, 15, 0, 0, 0,
        0, 0, 0, 14, 0, 0, 14, 0, 0, 15, 0, 15, 0, 14, 0, 15, 0, 0, 0, 0, 15, 0, 15, 0, 14, 0, 15, 0, 0, 0, 14, 0, 0, 15, 0, 14, 0, 15, 0, 0, 14, 0, 0, 15, 0, 14, 0, 15, 0, 0, 0, 15, 0, 14, 0, 0, 15, 0, 0, 0,
        0, 0, 0, 14, 0, 0, 14, 0, 0, 15, 0, 15, 0, 14, 25, 15, 0, 0, 0, 0, 14, 25, 15, 0, 14, 25, 15, 0, 0, 0, 14, 0, 0, 15, 0, 14, 25, 15, 0, 0, 14, 25, 25, 15, 0, 14, 25, 15, 0, 25, 25, 15, 0, 0, 2, 3, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 3,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "collidable",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          class = "",
          shape = "rectangle",
          x = 95.8335,
          y = 63.5002,
          width = 31.833,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 2,
          name = "",
          class = "",
          shape = "rectangle",
          x = 65.0835,
          y = 33.5,
          width = 94.333,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 192.834,
          y = 34.25,
          width = 30.833,
          height = 220.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 4,
          name = "",
          class = "",
          shape = "rectangle",
          x = 288.584,
          y = 35.25,
          width = 30.833,
          height = 220.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 5,
          name = "",
          class = "",
          shape = "rectangle",
          x = 225.084,
          y = 129.75,
          width = 61.833,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 6,
          name = "",
          class = "",
          shape = "rectangle",
          x = 353.084,
          y = 34.25,
          width = 30.833,
          height = 220.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 7,
          name = "",
          class = "",
          shape = "rectangle",
          x = 480.584,
          y = 63.75,
          width = 30.833,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 8,
          name = "",
          class = "",
          shape = "rectangle",
          x = 416.084,
          y = 192.5,
          width = 30.833,
          height = 33.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 9,
          name = "",
          class = "",
          shape = "rectangle",
          x = 417.084,
          y = 34,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 10,
          name = "",
          class = "",
          shape = "rectangle",
          x = 417.084,
          y = 225.75,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 11,
          name = "",
          class = "",
          shape = "rectangle",
          x = 416.584,
          y = 63.75,
          width = 31.333,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 12,
          name = "",
          class = "",
          shape = "rectangle",
          x = 480.334,
          y = 161,
          width = 31.333,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 13,
          name = "",
          class = "",
          shape = "rectangle",
          x = 417.084,
          y = 129.75,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 14,
          name = "",
          class = "",
          shape = "rectangle",
          x = 640.583,
          y = 226.25,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 15,
          name = "",
          class = "",
          shape = "rectangle",
          x = 769.583,
          y = 226.25,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 16,
          name = "",
          class = "",
          shape = "rectangle",
          x = 608.833,
          y = 98.5,
          width = 31.333,
          height = 61,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 17,
          name = "",
          class = "",
          shape = "rectangle",
          x = 864.833,
          y = 99.5,
          width = 31.333,
          height = 61,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 18,
          name = "",
          class = "",
          shape = "rectangle",
          x = 575.833,
          y = 34.5,
          width = 31.333,
          height = 92.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 19,
          name = "",
          class = "",
          shape = "rectangle",
          x = 896.833,
          y = 34.75,
          width = 31.333,
          height = 92.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 20,
          name = "",
          class = "",
          shape = "rectangle",
          x = 832.333,
          y = 131.75,
          width = 31.333,
          height = 92.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 21,
          name = "",
          class = "",
          shape = "rectangle",
          x = 640.833,
          y = 131.25,
          width = 31.333,
          height = 92.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 22,
          name = "",
          class = "",
          shape = "rectangle",
          x = 703.833,
          y = 162.75,
          width = 31.333,
          height = 63,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 23,
          name = "",
          class = "",
          shape = "rectangle",
          x = 768.833,
          y = 162.5,
          width = 31.333,
          height = 63,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 24,
          name = "",
          class = "",
          shape = "rectangle",
          x = 736.833,
          y = 130.5,
          width = 31.333,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 25,
          name = "",
          class = "",
          shape = "rectangle",
          x = 960.833,
          y = 66.25,
          width = 31.333,
          height = 190,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 26,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1056.83,
          y = 66,
          width = 31.333,
          height = 190,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 27,
          name = "",
          class = "",
          shape = "rectangle",
          x = 992.833,
          y = 34.5,
          width = 62.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 28,
          name = "",
          class = "",
          shape = "rectangle",
          x = 993.584,
          y = 129.75,
          width = 62.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 29,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1120.08,
          y = 34.75,
          width = 94.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 30,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1121.33,
          y = 66,
          width = 31.333,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 31,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1184.33,
          y = 160,
          width = 31.333,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 32,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1122.08,
          y = 131.25,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 33,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1121.08,
          y = 225.25,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 34,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1184.58,
          y = 64.75,
          width = 30.833,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 35,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1120.58,
          y = 192.75,
          width = 30.833,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 36,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1282.33,
          y = 65,
          width = 31.333,
          height = 162,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 37,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1281.58,
          y = 34.25,
          width = 124.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 38,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1280.58,
          y = 226.25,
          width = 126.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 39,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1377.58,
          y = 63.75,
          width = 30.833,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 40,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1376.58,
          y = 193.75,
          width = 30.833,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 41,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1440.08,
          y = 35,
          width = 94.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 42,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1441.33,
          y = 66.25,
          width = 31.333,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 43,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1504.33,
          y = 160.25,
          width = 31.333,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 44,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1442.08,
          y = 131.5,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 45,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1441.08,
          y = 225.5,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 46,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1504.58,
          y = 65,
          width = 30.833,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 47,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1440.58,
          y = 193,
          width = 30.833,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 48,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1568.08,
          y = 34,
          width = 94.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 49,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1569.33,
          y = 65.25,
          width = 31.333,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 50,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1632.33,
          y = 159.25,
          width = 31.333,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 51,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1570.08,
          y = 130.5,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 52,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1569.08,
          y = 224.5,
          width = 93.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 55,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1697.33,
          y = 66,
          width = 31.333,
          height = 157,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 56,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1794.33,
          y = 66.5,
          width = 31.333,
          height = 157,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 57,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1729.58,
          y = 35.25,
          width = 62.833,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 58,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1729.58,
          y = 227.25,
          width = 60.833,
          height = 28.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 59,
          name = "",
          class = "",
          shape = "rectangle",
          x = 3.25017,
          y = 323.917,
          width = 1916.17,
          height = 29.5,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 60,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1921,
          y = 0.666833,
          width = 3.33337,
          height = 321.333,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 61,
          name = "",
          class = "",
          shape = "rectangle",
          x = -4.33335,
          y = -0.6665,
          width = 3.33337,
          height = 321.333,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "enemies",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    }
  }
}
