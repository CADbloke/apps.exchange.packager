rem @echo off

%DEVBIN%\bin\candle.exe .\temp\root.wxs -out .\temp\plugin.wixobj -v
if ERRORLEVEL 1 (
	echo "Wix/Candle error - Build aborted!"
	goto end
) else (
	%DEVBIN%\bin\light.exe -sw1076 -ext WixNetFxExtension .\temp\plugin.wixobj -out ".\output\%AppName%-win64.msi" -v -sice:ICE80
	if ERRORLEVEL 1 (
		echo "Wix/Light error - Build aborted!"
		goto end
	)
)

:end

::   need the WixNetFxExtension  for .NET framework versions    https://stackoverflow.com/questions/27428528/unresolved-reference-to-symbol-propertynetframework45-in-section-product/27946359#27946359
