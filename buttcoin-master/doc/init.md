Sample init scripts and service configuration for buttcoind
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/buttcoind.service:    systemd service unit configuration
    contrib/init/buttcoind.openrc:     OpenRC compatible SysV style init script
    contrib/init/buttcoind.openrcconf: OpenRC conf.d file
    contrib/init/buttcoind.conf:       Upstart service configuration file
    contrib/init/buttcoind.init:       CentOS compatible SysV style init script

Service User
---------------------------------

All three Linux startup configurations assume the existence of a "buttcoin" user
and group.  They must be created before attempting to use these scripts.
The OS X configuration assumes buttcoind will be set up for the current user.

Configuration
---------------------------------

At a bare minimum, buttcoind requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, buttcoind will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that buttcoind and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If buttcoind is run with the "-server" flag (set by default), and no rpcpassword is set,
it will use a special cookie file for authentication. The cookie is generated with random
content when the daemon starts, and deleted when it exits. Read access to this file
controls who can access it through RPC.

By default the cookie is stored in the data directory, but it's location can be overridden
with the option '-rpccookiefile'.

This allows for running buttcoind without having to do any manual configuration.

`conf`, `pid`, and `wallet` accept relative paths which are interpreted as
relative to the data directory. `wallet` *only* supports relative paths.

For an example configuration file that describes the configuration settings,
see `contrib/debian/examples/buttcoin.conf`.

Paths
---------------------------------

### Linux

All three configurations assume several paths that might need to be adjusted.

Binary:              `/usr/bin/buttcoind`  
Configuration file:  `/etc/buttcoin/buttcoin.conf`  
Data directory:      `/var/lib/buttcoind`  
PID file:            `/var/run/buttcoind/buttcoind.pid` (OpenRC and Upstart) or `/var/lib/buttcoind/buttcoind.pid` (systemd)  
Lock file:           `/var/lock/subsys/buttcoind` (CentOS)  

The configuration file, PID directory (if applicable) and data directory
should all be owned by the buttcoin user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
buttcoin user and group.  Access to buttcoin-cli and other buttcoind rpc clients
can then be controlled by group membership.

### Mac OS X

Binary:              `/usr/local/bin/buttcoind`  
Configuration file:  `~/Library/Application Support/buttcoin/buttcoin.conf`  
Data directory:      `~/Library/Application Support/buttcoin`  
Lock file:           `~/Library/Application Support/buttcoin/.lock`  

Installing Service Configuration
-----------------------------------

### systemd

Installing this .service file consists of just copying it to
/usr/lib/systemd/system directory, followed by the command
`systemctl daemon-reload` in order to update running systemd configuration.

To test, run `systemctl start buttcoind` and to enable for system startup run
`systemctl enable buttcoind`

### OpenRC

Rename buttcoind.openrc to buttcoind and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
`/etc/init.d/buttcoind start` and configure it to run on startup with
`rc-update add buttcoind`

### Upstart (for Debian/Ubuntu based distributions)

Drop buttcoind.conf in /etc/init.  Test by running `service buttcoind start`
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon utility.

### CentOS

Copy buttcoind.init to /etc/init.d/buttcoind. Test by running `service buttcoind start`.

Using this script, you can adjust the path and flags to the buttcoind program by
setting the buttcoinD and FLAGS environment variables in the file
/etc/sysconfig/buttcoind. You can also use the DAEMONOPTS environment variable here.

### Mac OS X

Copy org.buttcoin.buttcoind.plist into ~/Library/LaunchAgents. Load the launch agent by
running `launchctl load ~/Library/LaunchAgents/org.buttcoin.buttcoind.plist`.

This Launch Agent will cause buttcoind to start whenever the user logs in.

NOTE: This approach is intended for those wanting to run buttcoind as the current user.
You will need to modify org.buttcoin.buttcoind.plist if you intend to use it as a
Launch Daemon with a dedicated buttcoin user.

Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
