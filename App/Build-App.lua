project "App"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files { "Source/**.h", "Source/**.cpp" }

   includedirs
   {
      "Source",

	  -- Include Core
	  "../Core/Source"
   }

   links
   {
      "Core"
   }

   targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
   debugdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")


-- Copy resources to the output directory
   -- postbuildcommands {
   --    "xcopy /Q /E /Y /I \"extern\\Kaleido\\resources\\shaders\" \"bin\\" .. OutputDir .. "\\resources\\shaders\"",
   --    "xcopy /Q /E /Y /I \"resources\\fonts\" \"bin\\" .. OutputDir .. "\\resources\\fonts\"",
   --    "xcopy /Q /E /Y /I \"resources\\exampleFiles\" \"bin\\" .. OutputDir .. "\\exampleFiles\"",
   --    "xcopy /Q /E /Y /I \"resources\\startup\" \"bin\\" .. OutputDir .. "\"",
   -- }

   filter "system:windows"
      systemversion "latest"
      defines { "WINDOWS" }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"