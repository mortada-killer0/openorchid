// System preferences
pref("b2g.system_startup_url", "chrome://system/content/index.html");
pref("b2g.neterror.url", "http://system.localhost:8081/net_error.html");

// Privacy preferences
pref("privacy.trackingprotection.enabled", true);
pref("privacy.trackingprotection.pbmode.enabled", true);
pref("security.disallow_privileged_https_stylesheet_loads", false);

// Device sensor preferences
pref("device.sensors.enabled", true);
pref("device.sensors.motion.enabled", true);
pref("device.sensors.orientation.enabled", true);
pref("device.sensors.proximity.enabled", true);
pref("device.sensors.ambientLight.enabled", true);

// HTTP preferences
pref("network.http.accept-encoding", "gzip, deflate, br");

// Voice input preferences
pref("voice-input.icon-url", "http://shared.localhost:8081/icons/voice_input.svg");

// APZ preferences
pref("apz.overscroll.enabled", true);

// Full-screen mode preferences
user_pref("full-screen-api.transition-duration.enter", "1000 1000");
user_pref("full-screen-api.transition-duration.leave", "1000 1000");
user_pref("full-screen-api.warning.timeout", 3000);
