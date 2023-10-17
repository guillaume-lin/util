# -*- coding: utf-8 -*-
#!/usr/bin/python
import subprocess
import time

#
#    show all branch that have merged into master
#    git branch --merged master

#
#    delete branch 
#    git branch -D <branch-name> 
#
#    get branch commit id
#    git rev-parse --short <branch-name>
#
#    get branch commit time
#    git log -n 1 --format=%ct <branch-name>
#    
#

def run_git_command(args):
    return subprocess.run(args,shell=True,check=True,capture_output = True,encoding="UTF-8")

def list_branch_merged(branch):
    r = run_git_command(['git','branch','--merged',branch])
    
    if r.returncode != 0:
        raise "list error"
    branches = r.stdout.split("\n")
    return filter(lambda name: not name.endswith("master") and not len(name)<1,map(lambda name: name.strip(" "),branches))

def get_branch_commit_time(branch):
    r = run_git_command(['git','log','-n 1','--format=%ct',branch])
    secs = int(r.stdout.strip("\n"))
    return (branch,secs,time.ctime(secs))

def delete_local_branch(branch):
    r = run_git_command(['git','branch','-d',branch])
    return r.stdout

def delete_remote_branch(branch):
    try:
        r = run_git_command(['git','push','origin','--delete',branch])
        return r.stdout
    except Exception as ex:
        print(ex)

def get_time(strTime):
    return int(time.mktime(time.strptime(strTime,"%Y-%m-%d %H:%M:%S")))

if __name__ == '__main__':
    #list all branch
    #check branch last modified time
    #check if branch include in master, if so, delete it
    print(1)
    branches = list_branch_merged("master")
    print(2)
    branches = map(get_branch_commit_time,branches)
    #print("will sort "+str(len(list(branches))))
    branches = sorted(branches,key=lambda t:t[1])
    print("sort done")
    branches = filter(lambda b: b[1]<get_time("2023-06-30 00:00:00"),branches)
    for b in branches:
        print(b)
        delete_local_branch(b[0])
        delete_remote_branch(b[0])
        
