From: "Sanjay Jain" <sjain@Sanera.net>
Subject: unhandled kernel  unaligned access
Date: Wed, 6 Mar 2002 11:26:55 -0800
Message-ID: <MPEHJBMAKDIKNMNLMJCLIELJCBAA.sjain@sanera.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.21.0203060601520.2409-100000@hlubocky.del.cz>
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020306192655._0IHnOnwnhJStSRlEERZLzHVBoKL32yqSXMVzVYSksA@z>

hi all,

I am running a kernel test program which makes following call.

getpeername(s, tdat[testno].sockaddr,tdat[testno].salen));

In one particular case tdat[testno].salen is set to 1 which is a unaligned
and invalid addr. It results in following oops.

Unhandled kernel unaligned access in unaligned.c:emulate_load_store_insn,
line
373:
$0 : 00000000 10000024 00000000 00000005
$4 : 10000d20 00000000 10000d20 00000001
$8 : ffffffff 8b179e98 801c6da0 00000003
$12: 00000000 00000002 8b179ecc 8f9875bc
$16: 8b1954c0 00000001 10000d20 00000001
$20: 004014e0 10002e08 00000000 0000000d
$24: 00000001 2ac2db50
$28: 8b178000 8b179e70 7fff7c70 801c6e2c
epc    : 00000000801c58d4
Status : 10009f03
Cause  : 00800010

BadAddr: 0000000000000001Process getpeername01 (pid: 9673,
stackpage=8b178000)
Stack: 8b179ec8 8eedf5a0 8b1954c0 00000001 801c6e2c 801c6dc4 8022370c
8020c788
       8b179ec8 8eedf5a0 00010060 8eedf5a0 00000005 801c5b08 802c2048
8023a65c
       000001d7 00000400 8b179ec8 00000005 000001d7 8eeb7780 5b343731
5d00d538
       8fd2cd80 ffffffea 8eeb7780 00000000 00000000 00000001 00000003
00000003
       7fff7c58 00000002 801c69b8 00406950 00401190 00000001 7fff7d24
00406950
       8b1954c0 ...
Call Trace: [<801c6e2c>] [<801c6dc4>] [<8022370c>] [<8020c788>] [<801c5b08>]
[<
8023a65c>]
 [<801c69b8>] [<8010dce8>]

Code: 04600003  00402821  8ce20000 <00002821> 00403021  10a00004  00a01021
8fb
f0010  03e00008

Is this the expected behavior if an unaligned address is passed in a system
call?
