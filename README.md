# reliant-assignment
Reliant assignment

Implement a Puppet solution for managing a service and backup its output files.
Requirements:

1 - Write a shellscript that:
	1.1. Runs in background indefinitely like a service
	1.2. On every minute create a file on a predetermined path containing the current weather forecast for João Pessoa

2. Write a Puppet manifest to manage the shellscript as a service:
	2.1. The service must be restarted every puppet run, if it is not running.
	2.2. The start, stop, and status commands should be explicitly declared on the manifest.
	2.3. The script file should be managed by Puppet, it must be on the path /usr/local/bin/.

3. Write a script to backup files created by the service.
	3.1. The script can be written in shellscript, ruby or python
	3.2. The script should be puppet managed
	3.3. A Cron job should be used to execute the script in daily basis. This cronjob must be managed by Puppet.
	3.4. The backup files should be packed and compressed with tar and gzip
	3.5. The backup files should stored at /backup/{Month-Day-Hour-Minute}/service.backup path.
	3.6. The backup files should be only accessible by root, with read permission.
	3.7. The script should only retain the latest 10 backups

Additional information:
	- No time to implement everything? No problem, say what is missing and deliver anyway.
	- You can choose between running it standalone (with puppet apply) or on a client-server fashion
	- You can choose whatever source for the weather forecast you want, it is just a source of data

Things we will care about:
	- How you elaborated both scripts
	- Proper use of Puppet resources to manage the scripts and the cronjob
