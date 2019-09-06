schemaVersion: '2.0.0'

# globalEnvVars:
#   - key: "NODE_TAG"
#     value: "$NODE_TAG"
# commandTests:
#   - name: "node version"
#     command: "node"
#     args: ["-v"]
#     expectedOutput: ["$NODE_TAG"]

commandTests:
  - name: "node version"
    command: "/bin/echo"
    args: ["${BAKERY_NODE_TAG}"]
    expectedOutput: ["11-alpine"]
fileExistenceTests:
- name: 'Node Binary File'
  path: '/usr/local/bin/node'
  shouldExist: true
  permissions: '-rwxr-xr-x'
  uid: 0
  gid: 0
  isExecutableBy: 'group'
- name: 'Python Binary File'
  path: '/usr/local/bin/python3.6'
  shouldExist: true
  permissions: '-rwxr-xr-x'
  uid: 0
  gid: 0
  isExecutableBy: 'group'