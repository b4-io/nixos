{
	programs.hyprland = {
		enable = true;
		withUWSM = true;
		xwayland.enable = true;
	};

	programs.uwsm.enable = true;
	security.pam.services.hyprlock = {};
}
