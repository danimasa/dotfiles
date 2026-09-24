hl.on("hyprland.start", function()
	hl.exec_cmd("rclone --vfs-cache-mode full mount OneDrive: ~/OneDrive &")
	hl.exec_cmd("rclone --vfs-cache-mode full mount Google: ~/GoogleDrive &")
end)
