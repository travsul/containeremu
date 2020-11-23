This project provides a docker setup for running [SWGEmu](https://github.com/swgemu/Core3) locally.

This is loosely based off a [great project to mimic ZonamaDev](https://github.com/thmhoag/swgemu-docker)

## Required files
- All the required tre files go in `/tres` these can be found in a legally obtained copy of SWG.
- Configs go in `/conf` this includes the lua configs [here](https://github.com/swgemu/Core3/tree/unstable/MMOCoreORB/bin/conf) most importantly [config.lua](https://github.com/swgemu/Core3/blob/unstable/MMOCoreORB/bin/conf/config.lua) so we can easily load in changes on the fly
- [Core3 itself](https://github.com/swgemu/Core3) should be cloned here in `/Core3`
- We can add sql to run on initialization in `/sql` most importantly you need [swgemu.sql](https://github.com/swgemu/Core3/blob/unstable/MMOCoreORB/sql/swgemu.sql) to set up the initial databases. There's also a great script in `swgemu-docker` to [create an admin account](https://github.com/thmhoag/swgemu-docker/blob/master/sql/02-admin_account.sql)
- We can also add customer lua scripts (such as themeparks and other configs) to `/custom_scripts`

Note the [sql information set here](docker-compose.yml#L12) needs to be matched in the `config.lua` listed above.