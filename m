Message-ID: <000901c13d8f$1471bb20$751c690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
Subject: About KGDB debug questions...
Date: Sat, 15 Sep 2001 10:35:27 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010915023527.c-kR98M45c8hsszTVcVpV57Z0Opb0LuQo4a_ddJ-D4c@z>

Hello,

    I have a question about KGDB debug. Sometimes when I run 'n' on host
GDB, then the target KGDB receive many packets and cannot stop, and the EPC
is adding 4 each time it receives a packet. It looks like  'c'without any
breakpoints.
Any suggestions? Are there any patches?

And what is the latest mips version of linux? Which tree can I download it ?

BTW:Currently I use linux-2.4.5-pre1.



machael thailer
