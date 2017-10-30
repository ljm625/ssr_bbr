# SSR with BBR modified version

This is a SSR with BBR docker image which you can use on your OpenVz machine or kubernetes environment.


There are 4 environment variables you can change.

SSRPASS : The password for SSR, by default it's "defaultpass"
SSRENC : The encryption method for SSR, by default it's "chacha20-ietf"
SSRPRO : The protocol for SSR, by default it's "auth_sha1_v4_compatible"
SSROBFS : The OBFS for SSR, by default it's "tls1.2_ticket_fastauth_compatible"


Thanks to author of modified rinetd BBR version, as well as author of SSR.

