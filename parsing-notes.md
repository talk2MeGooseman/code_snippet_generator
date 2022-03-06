Bound Box is the x and y coordinate pairs for each corner the imginary box around our code line.

First two values in the array are the x and y of the top right corner of the box.
Each subsequent pair is the x and y of the next corner moving in the clockwise direction.

Full width of image is 1199

First line starting x is 97

97
97
97
120
144
145
121

1090 - 97 = 993 total width of box
91 characters
993/91 = 10.9 characters per pixel

1023 - 97 = 926 total width of box
88 characters
926/88 = 10.5 characters per pixel

470 - 120 = 350 total width of box
30 characters
350/30 = 11.6 characters per pixel

363 - 144 = 219 total width of box
20 characters
219/20 = 10.9 characters per pixel

11 pixels for each character

120 - 97 = 23
23/11 = 2.3 characters of indent

144 - 97 = 47
47/11 = 4.2 characters of indent

%{
  "analyzeResult" => %{
    "modelVersion" => "2021-04-12",
    "readResults" => [
      %{
        "angle" => -0.1123,
        "height" => 536,
        "lines" => [
          %{
            "appearance" => %{
              "style" => %{"confidence" => 0.821, "name" => "other"}
            },
            "boundingBox" => [97, 150, 1090, 149, 1090, 173, 97, 173],
            "text" => "const pluckDeep = key => obj => key. split('. '). reduce( ( accum, key) => accum[key], obj)",
            "words" => [
              %{
                "boundingBox" => [98, 152, 154, 152, 155, 173, 98, 173],
                "confidence" => 0.994,
                "text" => "const"
              },
              %{
                "boundingBox" => [163, 152, 269, 151, 270, 173, 163, 173],
                "confidence" => 0.994,
                "text" => "pluckDeep"
              },
              %{
                "boundingBox" => [279, 151, 293, 151, 293, 173, 280, 173],
                "confidence" => 0.994,
                "text" => "="
              },
              %{
                "boundingBox" => [303, 151, 339, 151, 339, 173, 303, 173],
                "confidence" => 0.999,
                "text" => "key"
              },
              %{
                "boundingBox" => [349, 151, 373, 151, 374, 173, 349, 173],
                "confidence" => 0.949,
                "text" => "=>"
              },
              %{
                "boundingBox" => [383, 151, 421, 150, 421, 173, 383, 173],
                "confidence" => 0.997,
                "text" => "obj"
              },
              %{
                "boundingBox" => [430, 150, 454, 150, 454, 173, 430, 173],
                "confidence" => 0.949,
                "text" => "=>"
              },
              %{
                "boundingBox" => [464, 150, 508, 150, 508, 173, 464, 173],
                "confidence" => 0.986,
                "text" => "key."
              },
              %{
                "boundingBox" => [512, 150, 602, 150, 602, 173, 512, 173],
                "confidence" => 0.804,
                "text" => "split('."
              },
              %{
                "boundingBox" => [606, 150, 635, 150, 635, 173, 606, 173],
                "confidence" => 0.825,
                "text" => "')."
              },
              %{
                "boundingBox" => [639, 150, 716, 150, 716, 173, 639, 173],
                "confidence" => 0.994,
                "text" => "reduce("
              },
              %{
                "boundingBox" => [720, 150, 728, 150, 728, 173, 720, 173],
                "confidence" => 0.996,
                "text" => "("
              },
              %{
                "boundingBox" => [732, 150, 804, 150, 804, 173, 732, 173],
                "confidence" => 0.994,
                "text" => "accum,"
              },
              %{
                "boundingBox" => [812, 150, 862, 150, 862, 173, 811, 173],
                "confidence" => 0.987,
                "text" => "key)"
              },
              %{
                "boundingBox" => [869, 150, 893, 150, 893, 173, 869, 173],
                "confidence" => 0.967,
                "text" => "=>"
              },
              %{
                "boundingBox" => [905, 150, 1036, 151, 1035, 174, 904, 173],
                "confidence" => 0.994,
                "text" => "accum[key],"
              },
              %{
                "boundingBox" => [1043, 151, 1090, 151, 1089, 174, 1042, 174],
                "confidence" => 0.987,
                "text" => "obj)"
              }
            ]
          },
          %{
            "appearance" => %{
              "style" => %{"confidence" => 0.878, "name" => "other"}
            },
            "boundingBox" => [97, 201, 1023, 201, 1023, 223, 97, 223],
            "text" => "const compose = (. . . fns) => res => fns. reduce( (accum, next) => next(accum), res)",
            "words" => [
              %{
                "boundingBox" => [98, 203, 154, 203, 155, 223, 99, 223],
                "confidence" => 0.988,
                "text" => "const"
              },
              %{
                "boundingBox" => [164, 203, 246, 203, 246, 223, 164, 223],
                "confidence" => 0.985,
                "text" => "compose"
              },
              %{
                "boundingBox" => [256, 202, 269, 202, 270, 223, 257, 223],
                "confidence" => 1,
                "text" => "="
              },
              %{
                "boundingBox" => [280, 202, 303, 202, 303, 223, 281, 223],
                "confidence" => 1,
                "text" => "(."
              },
              %{
                "boundingBox" => [307, 202, 313, 202, 314, 223, 307, 223],
                "confidence" => 1,
                "text" => "."
              },
              %{
                "boundingBox" => [317, 202, 324, 202, 324, 223, 318, 223],
                "confidence" => 1,
                "text" => "."
              },
              %{
                "boundingBox" => [328, 202, 375, 202, 376, 223, 328, 223],
                "confidence" => 0.894,
                "text" => "fns)"
              },
              %{
                "boundingBox" => [384, 202, 408, 202, 409, 223, 384, 223],
                "confidence" => 1,
                "text" => "=>"
              },
              %{
                "boundingBox" => [419, 202, 455, 202, 455, 223, 420, 223],
                "confidence" => 0.989,
                "text" => "res"
              },
              %{
                "boundingBox" => [464, 202, 489, 202, 489, 223, 465, 223],
                "confidence" => 1,
                "text" => "=>"
              },
              %{
                "boundingBox" => [501, 202, 543, 202, 543, 223, 502, 223],
                "confidence" => 0.789,
                "text" => "fns."
              },
              %{
                "boundingBox" => [546, 202, 625, 202, 625, 223, 547, 223],
                "confidence" => 1.0,
                "text" => "reduce("
              },
              %{
                "boundingBox" => [629, 202, 712, 202, 711, 223, 629, 223],
                "confidence" => 0.974,
                "text" => "(accum,"
              },
              %{
                "boundingBox" => [719, 202, 781, 202, 780, 223, 718, 223],
                "confidence" => 1,
                "text" => "next)"
              },
              %{
                "boundingBox" => [789, 202, 814, 202, 813, 223, 789, 223],
                "confidence" => 1,
                "text" => "=>"
              },
              %{
                "boundingBox" => [823, 202, 966, 202, 965, 224, 823, 223],
                "confidence" => 0.923,
                "text" => "next(accum),"
              },
              %{
                "boundingBox" => [974, 202, 1024, 202, 1023, 224, 974, 224],
                "confidence" => 0.615,
                "text" => "res)"
              }
            ]
          },
          %{
            "appearance" => %{
              "style" => %{"confidence" => 0.878, "name" => "other"}
            },
            "boundingBox" => [97, 252, 436, 250, 436, 273, 97, 274],
            "text" => "const unfold = (f, seed) => {",
            "words" => [
              %{
                "boundingBox" => [97, 255, 153, 254, 154, 273, 98, 273],
                "confidence" => 0.996,
                "text" => "const"
              },
              %{
                "boundingBox" => [164, 254, 233, 252, 233, 274, 164, 274],
                "confidence" => 0.995,
                "text" => "unfold"
              },
              %{
                "boundingBox" => [246, 252, 256, 252, 256, 274, 246, 274],
                "confidence" => 0.997,
                "text" => "="
              },
              %{
                "boundingBox" => [269, 252, 304, 251, 305, 274, 269, 274],
                "confidence" => 0.922,
                "text" => "(f,"
              },
              %{
                "boundingBox" => [316, 251, 374, 251, 375, 274, 316, 274],
                "confidence" => 0.994,
                "text" => "seed)"
              },
              %{
                "boundingBox" => [384, 251, 409, 251, 410, 274, 385, 274],
                "confidence" => 0.949,
                "text" => "=>"
              },
              %{
                "boundingBox" => [420, 251, 431, 251, 431, 274, 420, 274],
                "confidence" => 0.994,
                "text" => "{"
              }
            ]
          },
          %{
            "appearance" => %{
              "style" => %{"confidence" => 0.878, "name" => "other"}
            },
            "boundingBox" => [120, 278, 470, 277, 470, 300, 120, 301],
            "text" => "const go = (f, seed, acc) => {",
            "words" => [
              %{
                "boundingBox" => [120, 281, 177, 280, 178, 300, 121, 300],
                "confidence" => 0.996,
                "text" => "const"
              },
              %{
                "boundingBox" => [188, 280, 211, 279, 211, 301, 188, 301],
                "confidence" => 0.996,
                "text" => "go"
              },
              %{
                "boundingBox" => [222, 279, 233, 279, 234, 301, 223, 301],
                "confidence" => 0.996,
                "text" => "="
              },
              %{
                "boundingBox" => [245, 279, 282, 278, 283, 301, 246, 301],
                "confidence" => 0.994,
                "text" => "(f,"
              },
              %{
                "boundingBox" => [292, 278, 352, 278, 353, 301, 293, 301],
                "confidence" => 0.994,
                "text" => "seed,"
              },
              %{
                "boundingBox" => [361, 278, 410, 278, 411, 300, 362, 301],
                "confidence" => 0.863,
                "text" => "acc)"
              },
              %{
                "boundingBox" => [419, 278, 443, 278, 444, 300, 419, 300],
                "confidence" => 0.945,
                "text" => "=>"
              },
              %{
                "boundingBox" => [453, 278, 466, 278, 467, 299, 454, 300],
                "confidence" => 0.994,
                "text" => "{"
              }
            ]
          },
          %{
            "appearance" => %{
              "style" => %{"confidence" => 0.821, "name" => "other"}
            },
            "boundingBox" => [144, 303, 363, 302, 363, 324, 144, 325],
            "text" => "const res = f(seed )",
            "words" => [
              %{
                "boundingBox" => [144, 305, 201, 304, 201, 324, 144, 324],
                "confidence" => 0.994,
                "text" => "const"
              },
              %{
                "boundingBox" => [211, 304, 247, 304, 246, 324, 211, 324],
                "confidence" => 0.996,
                "text" => "res"
              },
              %{
                "boundingBox" => [257, 304, 269, 303, 269, 324, 257, 324],
                "confidence" => 0.994,
                "text" => "="
              },
              %{
                "boundingBox" => [282, 303, 350, 303, 349, 325, 281, 324],
                "confidence" => 0.986,
                "text" => "f(seed"
              },
              %{
                "boundingBox" => [354, 302, 363, 302, 362, 325, 353, 325],
                "confidence" => 0.996,
                "text" => ")"
              }
            ]
          },
          %{
            "appearance" => %{
              "style" => %{"confidence" => 0.878, "name" => "other"}
            },
            "boundingBox" => [145, 328, 768, 328, 768, 350, 145, 351],
            "text" => "return res ? go(f, res[1], acc. concat( [res[0]] ) ) : acc",
            "words" => [
              %{
                "boundingBox" => [146, 331, 210, 330, 210, 350, 145, 350],
                "confidence" => 0.994,
                "text" => "return"
              },
              %{
                "boundingBox" => [222, 330, 257, 330, 257, 351, 222, 350],
                "confidence" => 0.997,
                "text" => "res"
              },
              %{
                "boundingBox" => [270, 330, 281, 330, 280, 351, 270, 351],
                "confidence" => 0.997,
                "text" => "?"
              },
              %{
                "boundingBox" => [292, 329, 351, 329, 351, 351, 292, 351],
                "confidence" => 0.994,
                "text" => "go(f,"
              },
              %{
                "boundingBox" => [362, 329, 444, 329, 444, 352, 361, 351],
                "confidence" => 0.822,
                "text" => "res[1],"
              },
              %{
                "boundingBox" => [453, 329, 497, 329, 497, 352, 453, 352],
                "confidence" => 0.99,
                "text" => "acc."
              },
              %{
                "boundingBox" => [501, 329, 579, 329, 579, 351, 501, 352],
                "confidence" => 0.994,
                "text" => "concat("
              },
              %{
                "boundingBox" => [583, 329, 673, 329, 673, 351, 583, 351],
                "confidence" => 0.828,
                "text" => "[res[0]]"
              },
              %{
                "boundingBox" => [677, 329, 684, 329, 684, 351, 677, 351],
                "confidence" => 0.996,
                "text" => ")"
              },
              %{
                "boundingBox" => [688, 329, 698, 329, 698, 350, 688, 351],
                "confidence" => 0.991,
                "text" => ")"
              },
              %{
                "boundingBox" => [710, 329, 720, 329, 720, 350, 710, 350],
                "confidence" => 0.995,
                "text" => ":"
              },
              %{
                "boundingBox" => [731, 329, 765, 330, 766, 350, 732, 350],
                "confidence" => 0.997,
                "text" => "acc"
              }
            ]
          },
          %{
            "appearance" => %{
              "style" => %{"confidence" => 0.878, "name" => "other"}
            },
            "boundingBox" => [121, 379, 376, 378, 376, 402, 121, 402],
            "text" => "return go(f, seed, [])",
            "words" => [
              %{
                "boundingBox" => [121, 382, 188, 381, 188, 402, 121, 401],
                "confidence" => 0.994,
                "text" => "return"
              },
              %{
                "boundingBox" => [199, 380, 259, 380, 258, 403, 199, 402],
                "confidence" => 0.994,
                "text" => "go(f,"
              },
              %{
                "boundingBox" => [270, 379, 329, 379, 329, 403, 270, 403],
                "confidence" => 0.996,
                "text" => "seed,"
              },
              %{
                "boundingBox" => [338, 379, 375, 379, 375, 402, 338, 402],
                "confidence" => 0.959,
                "text" => "[])"
              }
            ]
          }
        ],
        "page" => 1,
        "unit" => "pixel",
        "width" => 1199
      }
    ],
    "version" => "3.2.0"
  },
  "createdDateTime" => "2022-02-06T20:38:28Z",
  "lastUpdatedDateTime" => "2022-02-06T20:38:29Z",
  "status" => "succeeded"
}
