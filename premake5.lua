workspace "SRenderEngine"
    architecture "x64"
    configurations{
        "Debug",
        "Release",
        "Dist"
    }
outputdir="%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir={}
IncludeDir["GLFW"]="SRenderEngine/vendor/GLFW/include"


include "SRenderEngine/vendor/GLFW"


project "SRenderEngine"
    location "SRenderEngine"
    kind "ConsoleApp"
    language "C++"


    targetdir ("bin/"..outputdir.."/%{prj.name}")
    objdir ("bin-int/"..outputdir.."/%{prj.name}")

    files{
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/src/**.c",
    }

    includedirs{
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
    }

    links{
        "GLFW",
        "opengl32.lib",
    }
    -- pchheader "sepch.h"
    -- pchsource "SRendorEngine/src/sepch.cpp"

    filter "configurations:Debug"
        defines "SE_DEBUG"
        symbols "On"
        buildoptions "/MDd"
        defines{
            "SE_ENABLE_ASSERT",
        }
    filter "configurations:Release"
        defines "SE_RELEASE"
        optimize "On"
        runtime "Release" 
    filter "configurations:Dist"
        defines "SE_DIST"
        optimize "On"
        runtime "Release"