# reliant-assignment
![Screenshot at Mar 28 15-54-16](https://user-images.githubusercontent.com/505148/160467231-0bde0698-56f1-4eec-b3e7-dccc220e7edc.png)

Implement a Puppet solution for managing a service and backup its output files.
Requirements:

1. Write a shellscript that:
    - Runs in background indefinitely like a service
    - On every minute create a file on a predetermined path containing the current weather forecast for João Pessoa

2. Write a Puppet manifest to manage the shellscript as a service:
   - The service must be restarted every puppet run, if it is not running.
   - The start, stop, and status commands should be explicitly declared on the manifest.
   - The script file should be managed by Puppet, it must be on the path /usr/local/bin/.

3. Write a script to backup files created by the service.
   - The script can be written in shellscript, ruby or python
   - The script should be puppet managed
   - A Cron job should be used to execute the script in daily basis. This cronjob must be managed by Puppet.
   - The backup files should be packed and compressed with tar and gzip
   - The backup files should stored at /backup/{Month-Day-Hour-Minute}/service.backup path.
   - The backup files should be only accessible by root, with read permission.
   - The script should only retain the latest 10 backups

Additional information:
- No time to implement everything? No problem, say what is missing and deliver anyway.
- You can choose between running it standalone (with puppet apply) or on a client-server fashion
- You can choose whatever source for the weather forecast you want, it is just a source of data

Things we will care about:
- How you elaborated both scripts
- Proper use of Puppet resources to manage the scripts and the cronjob
