import base64
from github import Github


username = "UserName"
password = "PasswordOrPersonalToken"

profile = Github(username, password)

orgs_path = [["/Alexandria-Library", "alexandria-library.org"],
             ["/package-scripts",    "package-scripts.org"],
             ["/.emacs.d",           "emacs.org"]]


for reponame, orgname in orgs_path:
    repo = profile.search_repositories(username + reponame)[0]
    content = repo.get_contents(orgname).content

    with open(orgname, 'wt', encoding='utf-8') as file:
        file.write(base64.b64decode(content).decode('utf8'))
