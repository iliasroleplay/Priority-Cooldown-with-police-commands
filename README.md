Based on https://forum.cfx.re/t/release-priority-cooldown/72856

Commands that work only if you have the esx job 'police', you change it to any job you want in the client.lua file.

/priority - Starts a priority cooldown

/inprogress - States that there is a priority in progress

/onhold - States that there is a priority on hold

/resetpcd- Cancels a priority timer

Change the cooldown timer iin "server.lua" on line 46.
