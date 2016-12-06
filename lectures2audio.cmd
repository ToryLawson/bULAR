@echo off
set vlc_path=C:\Program Files\VideoLAN\VLC\vlc.exe
set vlc_error=VLC executable not found at specified path. To resolve this error, edit the CMD file to point to the correct path.
set combine_string=""
if not exist "%vlc_path%" goto :vlc_not_found

for %%I in (*.mp4) do (call :convert "%%I")
call :append
goto :end

:convert
set output_filename="%~1.wav"
call "%%vlc_path%%" -I dummy -vvv %1 --no-sout-video --sout-audio --sout=#transcode{acodec=s16l,"channels=2"}:standard{access="file",mux="wav",dst=%%output_filename%%} vlc://quit
exit /B

:append
setlocal disableDelayedExpansion
set "wavfiles="
for %%I in (*.wav) do (call set wavfiles=%%wavfiles%% "%%I")
call "%%vlc_path%%" -I dummy -vvv %%wavfiles%% --sout "#transcode{acodec=mp3,ab=128,channels=2}:std{access=file,mux=raw,dst=final_combined.mp3}" --sout-keep vlc://quit
setlocal enableDelayedExpansion
rem uncomment the following line to enable automatic cleanup
rem for %%I in (*.wav) do (del "%%I")
exit /B

:vlc_not_found
@echo %vlc_error%
exit /B

:end
exit /B