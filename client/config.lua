Config = {
	DrawDistance = 3.0,
	Price = 50,
	BlipInfos = {
		Sprite = 290,
		Color = 38
	},
	BlipPound = {
		Sprite = 0,
		Color = 0
	},
	SpawnerMenu = {
		Color = { r = 241, g = 17, b = 17, a = 400 },
		Size = {x = 2.0, y = 2.0, z = 0.1},
		Marker = 1
	},
	SpawnerPoint = {
		Color = { r = 241, g = 17, b = 17, a = 400 },
		Size = {x = 6.2, y = 6.2, z = 0.1},
		Marker = 1
	},
}

Config.AdminsWithPeds = {
	"steam:1100001182ce69d", -- Marc cuenta buena
	"steam:110000140cd0511", -- Marc dos cuenta
	"steam:11000013daf44ec", -- raikz
	"steam:110000111d55997", -- ivanhoe
	"steam:110000105e3e4eb", -- Alex_Substance
    "steam:1100001111bd4c6", -- Pelucaas
    "steam:11000010489fdc9", -- Trento
    "steam:/" -- Sharingan
}

Config.Garages = {
    ["Central"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(215.92279052734,-809.75280761719,30.730318069458),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(232.32, -793.64, 30.6), 
                ["h"] = 157.04,

            }
        },
        ["camerapos"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = 233.96,
            ["y"] = -801.4, 
            ["z"] = 32.48,
            ["rotationX"] = -15.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 380.73228356242 
        }
    },
    ["Desnudos"] = {
        ["blip"] = false,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-1097.92, 4948.4, 218.36),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-1092.6, 4946.04, 218.32), 
                ["h"] = 161.28,

            }
        },
        ["camerapos"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -1090.68, 
            ["y"] = 4946.28,
            ["z"] = 223.32,    
            ["rotationX"] = -70.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 50.73228356242 
        }
	},
    ["Mirror Park"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(1035.0, -766.0, 58.0),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(1023.56, -762.0, 57.96), 
                ["h"] = 318.08,

            }
        },
        ["camerapos"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = 1026.0,    
            ["y"] = -761.88, 
            ["z"] = 59.96,
            ["rotationX"] = -50.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 40.73228356242 
        }
	},
	["Milton Road"] = {
		["blip"] = true,
		["positions"] = {
			["spawnermenu"] = {
				["pos"] = vector3(-564.96, 321.59, 84.4)
			},
			["vehiclespawner"] = {
				["pos"] = vector3(-583.92, 330.64, 84.92),
				["h"] = 263.38
			},
		},
		["camerapos"] = {
			["x"] = -577.77,
			["y"] = 336.99,
			["z"] = 87.4,
			["rotationX"] = -21.637795701623,
			["rotationY"] = 0.0,
			["rotationZ"] = 125.73228356242
		}
	},
    ["Clinton Avenue"] = {
		["blip"] = true,
		["positions"] = {
			["spawnermenu"] = {
				["pos"] = vector3(361.24, 294.8, 103.52)
			},
			["vehiclespawner"] = {
				["pos"] = vector3(375.92, 288.48, 103.2),
				["h"] = 72.6
			},
		},
		["camerapos"] = {
			["x"] = 374.18,
			["y"] = 292.74,
			["z"] = 104.27,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 207.69
		}
	},
    -- ["Glory Way"] = {
	-- 	["blip"] = true,
	-- 	["positions"] = {
	-- 		["spawnermenu"] = {
	-- 			["pos"] = vector3(985.92, -207.16, 70.92)
	-- 		},
	-- 		["vehiclespawner"] = {
	-- 			["pos"] = vector3(984.2, -215.56, 70.52),
	-- 			["h"] = 334.0
	-- 		},
	-- 	},
	-- 	["camerapos"] = {
	-- 		["x"] = 981.52,
	-- 		["y"] = -206.96,
	-- 		["z"] = 72.48,
	-- 		["rotationX"] = 0.0,
	-- 		["rotationY"] = 0.0,
	-- 		["rotationZ"] = 280.69
	-- 	}
	-- },
    ["Ruta 68"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(1054.52, 2655.28, 39.56),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(1059.32, 2662.64, 39.56), 
                ["h"] = 348.52,

            }
        },
        ["camerapos"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = 1056.64, 
            ["y"] = 2660.4, 
            ["z"] = 41.56, 
            ["rotationX"] = -45.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -50.73228356242 
        }
    },
    ["Hawick Avenue"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {    
                ["pos"] = vector3(278.84, -346.0, 44.96),
                ["colour"] = 201, 0, 0,

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(290.4, -336.12, 44.92), 
                ["h"] = 159.2,
                ["colour"] = 23, 201, 0,

            }
        },
        ["camerapos"] = { 
            ["x"] = 283.6, 
            ["y"] = -343.32, 
            ["z"] = 47.92, 
            ["rotationX"] = -20.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -50.73228356242 
        }
	},
	
	["Aguja Street"] = {
		["blip"] = true,	
		["positions"] = {
			["spawnermenu"] = {
				["pos"] = vector3(-1186.45, -1507.52, 4.40)
			},
			["vehiclespawner"] = {
				["pos"] = vector3(-1193.94, -1490.71, 4.38),
				["h"] = 215.85
			},
		},
		["camerapos"] = {
			["x"] = -1194.26,
			["y"] = -1498.14,
			["z"] = 5.38,
			["rotationX"] = 0.0,
			["rotationY"] = 0.0,
			["rotationZ"] = 354.44
		}
	},

    ["West Eclipse Boulevard"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-1803.8967285156, -341.45928955078, 43.986347198486),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-1810.7857666016, -337.13592529297, 43.552074432373), 
                ["h"] = 320.0,

            }
        },
        ["camerapos"] = { 
            ["x"] = -1813.5513916016, 
            ["y"] = -340.40087890625, 
            ["z"] = 46.962894439697, 
            ["rotationX"] = -39.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -42.110235854983 
        }
    },

    ["Autopia Parkway"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-70.92, -2005.08, 18.0),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-64.68, -2013.92, 18.0), 
                ["h"] = 105.0,

            }
        },
        ["camerapos"] = { 
            ["x"] = -70.76, 
            ["y"] = -2005.96, 
            ["z"] = 21.0, 
            ["rotationX"] = -30.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -200.110235854983 
        }
    },

    ["Alhambra Drive"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(1990.4, 3779.16, 32.2),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(1982.92, 3777.44, 32.2), 
                ["h"] = 203.76,

            }
        },
        ["camerapos"] = { 
            ["x"] = 1988.44, 
            ["y"] = 3774.12, 
            ["z"] = 34.2, 
            ["rotationX"] = -30.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 60.110235854983 
        }
    },

    ["Paleto Boulevard"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(125.202, 6644.688, 31.784),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(117.742, 6652.241, 30.776), 
                ["h"] = 134.0,

            }
        },
        ["camerapos"] = { 
            ["x"] = 117.909, 
            ["y"] = 6647.187, 
            ["z"] = 31.588, 
            ["rotationX"] = -0.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -0.110235854983 
        }
    },

    ["Aeropuerto L.S"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-1237.556, -3384.547, 13.940),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-1275.560, -3388.017, 14.240), 
                ["h"] = 328.940,

            }
        },
        ["camerapos"] = { 
            ["x"] = -1301.229, 
            ["y"] = -3385.397, 
            ["z"] = 24.265, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -87.73228356242 
        }
    },


    ["Americano Way"] = {
        ["blip"] = false,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-1535.2, 84.0, 56.78),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-1525.04, 86.44, 56.56), 
                ["h"] = 268.52,

            }
        },
        ["camerapos"] = { 
            ["x"] = -1531.04, 
            ["y"] = 86.48, 
            ["z"] = 59.52, 
            ["rotationX"] = -28.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -87.73228356242 
        }
    },

    ["Buen Vino Road"] = {
        ["blip"] = false,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-1923.48, 2059.28, 140.84),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-1911.0, 2060.28, 140.77), 
                ["h"] = 200.92,

            }
        },
        ["camerapos"] = { 
            ["x"] = -1912.4, 
            ["y"] = 2064.88, 
            ["z"] = 144.72, 
            ["rotationX"] = -48.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -157.73228356242 
        }
    },

    ["Grapeseed Avenue"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(1705.68, 4796.64, 41.88),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(1703.2, 4801.0, 41.76), 
                ["h"] = 91.2,

            }
        },
        ["camerapos"] = { 
            ["x"] = 1696.28, 
            ["y"] = 4796.48, 
            ["z"] = 43.88, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 300.73228356242 
        }
    },

    ["Davis Avenue"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-5.48, -1738.56, 29.32),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-7.48, -1744.48, 29.32), 
                ["h"] = 46.36,

            }
        },
        ["camerapos"] = { 
            ["x"] = -15.48, 
            ["y"] = -1740.48, 
            ["z"] = 31.32, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 250.73228356242 
        }
    },

    ["Autopista de Great Ocean"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-86.36, 6332.88, 31.48),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-79.4, 6332.84, 31.48), 
                ["h"] = 225.72,

            }
        },
        ["camerapos"] = { 
            ["x"] = -76.0, 
            ["y"] = 6325.64, 
            ["z"] = 33.48, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 30.73228356242 
        }
    },

    ["South Boulevard"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-964.84, -185.08, 37.8),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-973.24, -183.28, 37.9), 
                ["h"] = 207.96,

            }
        },
        ["camerapos"] = { 
            ["x"] = -968.28, 
            ["y"] = -187.16, 
            ["z"] = 39.8, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 30.73228356242 
        }
    },

    ["Autopista de Señora"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(2748.2, 3455.32, 56.0),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(2758.08, 3446.64, 55.96), 
                ["h"] = 66.16,

            }
        },
        ["camerapos"] = { 
            ["x"] = 2750.76, 
            ["y"] = 3447.24, 
            ["z"] = 57.08, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 270.73228356242 
        }
    },

    ["Jamestown Street"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(344.28, -1959.88, 24.48),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(354.84, -1962.04, 24.54), 
                ["h"] = 52.12,

            }
        },
        ["camerapos"] = { 
            ["x"] = 347.24, 
            ["y"] = -1958.08, 
            ["z"] = 26.4, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 220.73228356242 
        }
    },

    ["Spanish Avenue"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(-87.92, 86.68, 71.88),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(-96.52, 90.68, 71.76), 
                ["h"] = 242.48,

            }
        },
        ["camerapos"] = { 
            ["x"] = -91.56,
            ["y"] = 85.12, 
            ["z"] = 72.72, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 40.73228356242 
        }
    },

    ["Fudge Lane"] = {
        ["blip"] = true,
        ["positions"] = {
            ["spawnermenu"] = {
                ["pos"] = vector3(1150.48, -1654.72, 36.52),

            },
            ["vehiclespawner"] = {
                ["pos"] = vector3(1154.52, -1656.08, 36.56), 
                ["h"] = 208.76,

            }
        },
        ["camerapos"] = { 
            ["x"] = 1160.44, 
            ["y"] = -1660.64, 
            ["z"] = 38.48, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 60.73228356242 
        }
    }
}
